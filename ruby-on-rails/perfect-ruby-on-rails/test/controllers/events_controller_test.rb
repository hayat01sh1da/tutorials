# frozen_string_literal: true
# rbs_inline: enabled

class EventsControllerTest < ApplicationControllerTest
  setup do
    @event_owner = FactoryBot.create(:user)
    @event       = FactoryBot.create(:event, owner: event_owner)
  end

  test 'The event index is open to anonymous visitors' do
    get '/'

    assert_response :success
  end

  test 'The event index lists the events that have not started yet' do
    future = FactoryBot.create(:event, start_at: 2.days.from_now, end_at: 3.days.from_now)
    past   = FactoryBot.create(:event, start_at: 3.days.ago, end_at: 2.days.ago)
    get '/'

    assert_match(/#{Regexp.escape(future.name)}/, response.body)
    assert_no_match(/#{Regexp.escape(past.name)}/, response.body)
  end

  test 'The event index can be searched by name through ransack' do
    wanted = FactoryBot.create(:event, name: '探しているイベント', start_at: 2.days.from_now, end_at: 3.days.from_now)
    other  = FactoryBot.create(:event, name: '別のイベント', start_at: 2.days.from_now, end_at: 3.days.from_now)
    get '/', params: { q: { name_cont: '探している' } }

    assert_match(/#{Regexp.escape(wanted.name)}/, response.body)
    assert_no_match(/#{Regexp.escape(other.name)}/, response.body)
  end

  test 'The event show page is open to anonymous visitors' do
    get "/events/#{event.id}"

    assert_response :success
    assert_match(/#{Regexp.escape(event.name)}/, response.body)
  end

  test 'An unknown event id renders a 404' do
    get '/events/0'

    assert_response :not_found
  end

  test 'The events can be rendered as markdown' do
    get "/events/#{event.id}.md"

    assert_response :success
    assert_equal 'text/markdown; charset=utf-8', response.content_type
  end

  test 'The rendered markdown contains the event details' do
    get "/events/#{event.id}.md"

    [
      /# #{event.name}/,
      /主催者: #{event.owner.name}/,
      /開催場所: #{event.place}/,
      /イベント内容: #{event.content}/
    ].each do |pattern|
      assert_match(pattern, response.body)
    end
  end

  test 'The new event form requires a signed-in user' do
    get '/events/new'

    assert_redirected_to root_path
    assert_equal('ログインしてください', flash[:alert])
  end

  test 'The new event form is shown to a signed-in user' do
    sign_in_as(event_owner)
    get '/events/new'

    assert_response :success
  end

  test 'A signed-in user can create an event' do
    sign_in_as(event_owner)

    assert_difference -> { Event.count } => 1 do
      post '/events', params: { event: valid_event_params }
    end
    assert_equal('イベントを登録しました', flash[:notice])
  end

  test 'A created event belongs to the signed-in user' do
    sign_in_as(event_owner)
    post '/events', params: { event: valid_event_params }

    assert_equal(event_owner, Event.order(:created_at).last.owner)
  end

  test 'An invalid event is not created and the form is rendered again' do
    sign_in_as(event_owner)

    assert_no_difference -> { Event.count } do
      post '/events', params: { event: valid_event_params.merge(name: '') }
    end
    assert_response :success
  end

  test 'An anonymous visitor cannot create an event' do
    assert_no_difference -> { Event.count } do
      post '/events', params: { event: valid_event_params }
    end
    assert_redirected_to root_path
  end

  test 'The owner can open the edit form of their own event' do
    sign_in_as(event_owner)
    get "/events/#{event.id}/edit"

    assert_response :success
  end

  test 'Another user cannot open the edit form of the event' do
    sign_in_as(FactoryBot.create(:user))

    get "/events/#{event.id}/edit"

    assert_response :not_found
  end

  test 'The owner can update their own event' do
    sign_in_as(event_owner)
    patch "/events/#{event.id}", params: { event: { name: '更新後のイベント' } }

    assert_equal('更新後のイベント', event.reload.name)
    assert_equal('イベントを更新しました', flash[:notice])
  end

  test 'An invalid update is rejected and the form is rendered again' do
    sign_in_as(event_owner)
    patch "/events/#{event.id}", params: { event: { name: '' } }

    assert_response :success
    assert_not_equal('', event.reload.name)
  end

  test 'Another user cannot update the event' do
    sign_in_as(FactoryBot.create(:user))
    original = event.name

    patch "/events/#{event.id}", params: { event: { name: '乗っ取り' } }

    assert_response :not_found
    assert_equal(original, event.reload.name)
  end

  test 'The events of owner can be deleted' do
    sign_in_as(event_owner)

    assert_nothing_raised do
      assert_difference -> { Event.count } => -1 do
        delete "/events/#{event.id}"
      end
    end
  end

  test 'The events of other owners cannot be deleted' do
    sing_in_user = FactoryBot.create(:user)
    sign_in_as(sing_in_user)

    # assert_raise ActiveRecord::RecordNotFound do
    assert_nothing_raised do
      assert_no_difference -> { Event.count } do
        delete "/events/#{event.id}"
      end
    end
  end

  test 'An anonymous visitor cannot delete an event' do
    assert_no_difference -> { Event.count } do
      delete "/events/#{event.id}"
    end
    assert_redirected_to root_path
  end

  test 'Deleting an event redirects to the root path with a notice' do
    sign_in_as(event_owner)
    delete "/events/#{event.id}"

    assert_redirected_to root_path
    assert_equal('イベントを削除しました', flash[:notice])
  end

  private

  attr_reader :event_owner, :event

  # @rbs return: Hash[Symbol, untyped]
  def valid_event_params
    start_at = 2.days.from_now
    {
      name: '新しいイベント',
      place: '東京',
      content: 'イベントの説明',
      start_at: start_at,
      end_at: start_at + 3.hours
    }
  end
end
