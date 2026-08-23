# frozen_string_literal: true
# rbs_inline: enabled

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  test 'A ticket with an event, a user and a comment is valid' do
    ticket = Ticket.new(event: FactoryBot.create(:event), user: FactoryBot.create(:user), comment: '参加します')

    assert_predicate(ticket, :valid?)
  end

  test 'A ticket without a user is valid because the association is optional' do
    ticket = Ticket.new(event: FactoryBot.create(:event), user: nil)

    assert_predicate(ticket, :valid?)
  end

  test 'A ticket without an event is invalid' do
    ticket = Ticket.new(event: nil, user: FactoryBot.create(:user))
    ticket.valid?

    assert_not_empty(ticket.errors[:event])
  end

  test 'A comment of 30 characters is valid' do
    ticket = Ticket.new(event: FactoryBot.create(:event), comment: 'あ' * 30)
    ticket.valid?

    assert_empty(ticket.errors[:comment])
  end

  test 'A comment of 31 characters is invalid' do
    ticket = Ticket.new(event: FactoryBot.create(:event), comment: 'あ' * 31)
    ticket.valid?

    assert_not_empty(ticket.errors[:comment])
  end

  test 'A blank comment is allowed' do
    ticket = Ticket.new(event: FactoryBot.create(:event), comment: '')
    ticket.valid?

    assert_empty(ticket.errors[:comment])
  end

  test 'A nil comment is allowed' do
    ticket = Ticket.new(event: FactoryBot.create(:event), comment: nil)
    ticket.valid?

    assert_empty(ticket.errors[:comment])
  end

  test 'The same user cannot hold two tickets for the same event' do
    user  = FactoryBot.create(:user)
    event = FactoryBot.create(:event)
    Ticket.create!(user: user, event: event)

    assert_raises(ActiveRecord::RecordNotUnique) do
      Ticket.create!(user: user, event: event)
    end
  end

  test 'Different users can hold a ticket for the same event' do
    event = FactoryBot.create(:event)
    Ticket.create!(user: FactoryBot.create(:user), event: event)

    assert_difference -> { Ticket.count } => 1 do
      Ticket.create!(user: FactoryBot.create(:user), event: event)
    end
  end

  test 'Destroying the event destroys its tickets' do
    event = FactoryBot.create(:event)
    Ticket.create!(user: FactoryBot.create(:user), event: event)

    assert_difference -> { Ticket.count } => -1 do
      event.destroy!
    end
  end
end
