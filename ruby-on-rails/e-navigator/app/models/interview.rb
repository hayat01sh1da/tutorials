# frozen_string_literal: true
# rbs_inline: enabled

# Interview scheduled by a user. Validates that datetime is not in the past.
class Interview < ApplicationRecord
  belongs_to :user
  validates :datetime, presence: true
  validate :datetime_cannot_be_in_the_past
  enum :status, {
    suspended: 0,
    approved: 1,
    declined: 2
  }
  def datetime_cannot_be_in_the_past
    dt = datetime
    return unless dt && dt < Time.current

    errors.add(:datetime, 'に過去の日時は選択できません。')
  end
end
