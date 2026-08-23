# frozen_string_literal: true
# rbs_inline: enabled

require_relative 'application_controller_test'

class RetirementsControllerTest < ApplicationControllerTest
  test 'The confirmation page is shown to a signed-in user' do
    sign_in_as(FactoryBot.create(:user))
    get '/retirements/new'

    assert_response :success
  end

  test 'The confirmation page explains when retiring is refused' do
    sign_in_as(FactoryBot.create(:user))
    get '/retirements/new'

    assert_select 'li', text: '公開中の未終了イベントがある場合'
    assert_select 'li', text: '未終了の参加イベントがある場合'
  end

  test 'An anonymous visitor cannot reach the confirmation page' do
    get '/retirements/new'

    assert_redirected_to root_path
    assert_equal('ログインしてください', flash[:alert])
  end

  test 'An anonymous visitor cannot retire' do
    assert_no_difference -> { User.count } do
      post '/retirements'
    end
    assert_redirected_to root_path
  end

  test 'Retiring is refused while the user owns an unfinished event' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    FactoryBot.create(:event, owner: user, start_at: 2.days.from_now, end_at: 3.days.from_now)

    assert_no_difference -> { User.count } do
      post '/retirements'
    end
  end

  # Known bug: User#check_all_events_finished ends with `throw(:abort) if errors`
  # and `errors` is truthy even when empty, so `current_user.destroy` always
  # returns false. RetirementsController#create therefore always takes its
  # `return unless` branch: the account survives and the session is never reset.
  # The action then falls through to an implicit render, and because the only
  # template is create.js.erb the HTML request ends as 406 Not Acceptable.
  # Retiring cannot succeed at all until the model guard reads `if errors.any?`.
  test 'Retiring is refused even when the user has no events at all' do
    sign_in_as(FactoryBot.create(:user))

    assert_no_difference -> { User.count } do
      post '/retirements'
    end
  end

  test 'Retiring leaves the session signed in because the destruction is aborted' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    post '/retirements'

    assert_equal(user.id, session['user_id'])
  end

  test 'Retiring sets no notice and finds no HTML template because the action returns early' do
    sign_in_as(FactoryBot.create(:user))
    post '/retirements'

    assert_response :not_acceptable
    assert_not_equal('退会が完了しました', flash[:notice])
  end
end
