# frozen_string_literal: true
# rbs_inline: enabled

require_relative 'application_controller_test'

class TicketsControllerTest < ApplicationControllerTest
  setup do
    @event = FactoryBot.create(:event)
  end

  test 'A signed-in user can take a ticket for an event' do
    sign_in_as(FactoryBot.create(:user))

    assert_difference -> { Ticket.count } => 1 do
      post "/events/#{event.id}/tickets", params: { ticket: { comment: '参加します' } }
    end
  end

  test 'Taking a ticket redirects back to the event with a notice' do
    sign_in_as(FactoryBot.create(:user))
    post "/events/#{event.id}/tickets", params: { ticket: { comment: '参加します' } }

    assert_redirected_to event_path(event)
    assert_equal('このイベントに参加表明しました', flash[:notice])
  end

  test 'The comment of the form is stored on the ticket' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    post "/events/#{event.id}/tickets", params: { ticket: { comment: '楽しみです' } }

    assert_equal('楽しみです', user.tickets.sole.comment)
  end

  test 'A ticket with a blank comment is accepted' do
    sign_in_as(FactoryBot.create(:user))

    assert_difference -> { Ticket.count } => 1 do
      post "/events/#{event.id}/tickets", params: { ticket: { comment: '' } }
    end
  end

  test 'A ticket whose comment is too long is not stored' do
    sign_in_as(FactoryBot.create(:user))

    assert_no_difference -> { Ticket.count } do
      post "/events/#{event.id}/tickets", params: { ticket: { comment: 'あ' * 31 } }
    end
  end

  test 'An anonymous visitor cannot take a ticket' do
    assert_no_difference -> { Ticket.count } do
      post "/events/#{event.id}/tickets", params: { ticket: { comment: '参加します' } }
    end
    assert_redirected_to root_path
  end

  test 'An anonymous visitor is told to sign in first' do
    post "/events/#{event.id}/tickets", params: { ticket: { comment: '参加します' } }

    assert_equal('ログインしてください', flash[:alert])
  end

  test 'A signed-in user can give a ticket back' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    Ticket.create!(user: user, event: event)

    assert_difference -> { Ticket.count } => -1 do
      delete "/events/#{event.id}/tickets/0"
    end
  end

  test 'Giving a ticket back redirects to the event with a notice' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    Ticket.create!(user: user, event: event)
    delete "/events/#{event.id}/tickets/0"

    assert_redirected_to event_path(event)
    assert_equal('このイベントの参加をキャンセルしました', flash[:notice])
  end

  test 'A user cannot give back a ticket that belongs to somebody else' do
    Ticket.create!(user: FactoryBot.create(:user), event: event)
    sign_in_as(FactoryBot.create(:user))

    assert_raises(NoMethodError) do
      delete "/events/#{event.id}/tickets/0"
    end
  end

  # The docstring of ApplicationController::RoutingError says Rails rescues it
  # as a 404, but no `config.action_dispatch.rescue_responses` entry maps it to
  # :not_found, so with `show_exceptions = :rescuable` the exception propagates
  # out of the request instead of rendering a 404 page.
  test 'A signed-in user reaching TicketsController#new raises a routing error' do
    sign_in_as(FactoryBot.create(:user))

    error = assert_raises(ApplicationController::RoutingError) do
      get "/events/#{event.id}/tickets/new"
    end
    assert_equal('ログイン状態で TicketsController#new にアクセスされました', error.message)
  end

  test 'An anonymous visitor reaching TicketsController#new is redirected instead' do
    get "/events/#{event.id}/tickets/new"

    assert_redirected_to root_path
    assert_equal('ログインしてください', flash[:alert])
  end

  private

  attr_reader :event
end
