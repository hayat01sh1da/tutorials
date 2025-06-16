class EventsControllerTest < ApplicationControllerTest
  setup do
    @event_owner = FactoryBot.create(:user)
    @event       = FactoryBot.create(:event, owner: event_owner)
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

  private

  attr_reader :event_owner, :event
end
