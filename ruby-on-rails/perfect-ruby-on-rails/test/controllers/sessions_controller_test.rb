# frozen_string_literal: true
# rbs_inline: enabled

require_relative 'application_controller_test'

class SessionsControllerTest < ApplicationControllerTest
  test 'The OmniAuth callback signs a brand-new user in' do
    user = FactoryBot.build(:user, uid: '900001')

    assert_difference -> { User.count } => 1 do
      sign_in_as(user)
    end
  end

  test 'The OmniAuth callback redirects to the root path with a notice' do
    sign_in_as(FactoryBot.build(:user, uid: '900002'))

    assert_redirected_to root_path
    assert_equal('ログインしました', flash[:notice])
  end

  test 'The OmniAuth callback reuses the user of a known provider and uid' do
    user = FactoryBot.create(:user, uid: '900003')

    assert_no_difference -> { User.count } do
      sign_in_as(user)
    end
  end

  test 'The signed-in user is remembered in the session' do
    user = FactoryBot.create(:user, uid: '900004')
    sign_in_as(user)

    assert_equal(user.id, session['user_id'])
  end

  test 'The OmniAuth callback is reachable without being signed in' do
    sign_in_as(FactoryBot.build(:user, uid: '900005'))

    assert_not_equal('ログインしてください', flash[:alert])
  end

  test 'Signing out clears the session' do
    sign_in_as(FactoryBot.create(:user, uid: '900006'))
    delete '/logout'

    assert_nil(session['user_id'])
  end

  test 'Signing out redirects to the root path with a notice' do
    sign_in_as(FactoryBot.create(:user, uid: '900007'))
    delete '/logout'

    assert_redirected_to root_path
    assert_equal('ログアウトしました', flash[:notice])
  end

  test 'Signing out is refused while nobody is signed in' do
    delete '/logout'

    assert_redirected_to root_path
    assert_equal('ログインしてください', flash[:alert])
  end
end
