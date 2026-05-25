# frozen_string_literal: true
# rbs_inline: enabled

# RSVP linking a User to an Event with an optional comment.
class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true
end
