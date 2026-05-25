# frozen_string_literal: true
# rbs_inline: enabled

# A user account. Owns created_events and joins participating_events through
# Tickets; refuses destruction while unfinished events remain.
class User < ApplicationRecord
  before_destroy :check_all_events_finished

  has_many :created_events,
           class_name: 'Event',
           foreign_key: 'owner_id',
           inverse_of: :owner,
           dependent: :destroy
  has_many :tickets, dependent: :nullify
  has_many :participating_events, through: :tickets, source: :event

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider  = auth_hash[:provider]
    uid       = auth_hash[:uid]
    nickname  = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name      = nickname
      user.image_url = image_url
    end
  end

  private

  def check_all_events_finished
    now = Time.zone.now
    errors.add(:base, '公開中の未終了イベントが存在します。') if created_events.exists?([':now < end_at', { now: now }])
    errors.add(:base, '未終了の参加イベントが存在します。') if participating_events.exists?([':now < end_at', { now: now }])
    throw(:abort) if errors
  end
end
