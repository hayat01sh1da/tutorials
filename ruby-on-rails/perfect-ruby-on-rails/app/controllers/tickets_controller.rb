# frozen_string_literal: true
# rbs_inline: enabled

# Lets a signed-in user RSVP to an event by creating or destroying a Ticket.
class TicketsController < ApplicationController
  def new
    raise ApplicationController::RoutingError, I18n.t('errors.tickets.invalid_route')
  end

  def create
    event = Event.find(params.expect(:event_id))
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = params[:ticket][:comment]
    end
    return unless @ticket.save

    redirect_to event, notice: I18n.t('flash.tickets.created')
  end

  def destroy
    ticket = current_user.tickets.find_by(event_id: params[:event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: I18n.t('flash.tickets.destroyed')
  end
end
