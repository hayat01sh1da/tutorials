# frozen_string_literal: true
# rbs_inline: enabled

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '.find_or_create_from_auth_hash! creates a user that does not exist yet' do
    assert_difference -> { User.count } => 1 do
      User.find_or_create_from_auth_hash!(auth_hash)
    end
  end

  test '.find_or_create_from_auth_hash! copies the nickname and the image of the auth hash' do
    user = User.find_or_create_from_auth_hash!(auth_hash)

    assert_equal('Oasist', user.name)
    assert_equal('http://example.com/oasist.jpg', user.image_url)
  end

  test '.find_or_create_from_auth_hash! returns the existing user of the same provider and uid' do
    existing = User.find_or_create_from_auth_hash!(auth_hash)

    assert_no_difference -> { User.count } do
      assert_equal(existing, User.find_or_create_from_auth_hash!(auth_hash))
    end
  end

  test '.find_or_create_from_auth_hash! keeps the attributes of the existing user' do
    existing = User.find_or_create_from_auth_hash!(auth_hash)
    User.find_or_create_from_auth_hash!(auth_hash(nickname: '別名', image: 'http://example.com/other.jpg'))

    assert_equal('Oasist', existing.reload.name)
  end

  test '.find_or_create_from_auth_hash! tells apart the same uid on another provider' do
    User.find_or_create_from_auth_hash!(auth_hash)

    assert_difference -> { User.count } => 1 do
      User.find_or_create_from_auth_hash!(auth_hash(provider: 'gitlab'))
    end
  end

  test 'The pair of provider and uid is unique' do
    user = FactoryBot.create(:user)

    assert_raises(ActiveRecord::RecordNotUnique) do
      FactoryBot.create(:user, provider: user.provider, uid: user.uid)
    end
  end

  test '#created_events returns the events the user owns' do
    user  = FactoryBot.create(:user)
    event = FactoryBot.create(:event, owner: user)
    FactoryBot.create(:event)

    assert_equal([event], user.created_events.to_a)
  end

  test '#participating_events returns the events the user holds a ticket for' do
    user  = FactoryBot.create(:user)
    event = FactoryBot.create(:event)
    Ticket.create!(user: user, event: event)

    assert_equal([event], user.participating_events.to_a)
  end

  test '#destroy is rejected while the user owns an unfinished event' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:event, owner: user, start_at: 2.days.from_now, end_at: 3.days.from_now)

    assert_not(user.destroy)
    assert_includes(user.errors.full_messages, '公開中の未終了イベントが存在します。')
  end

  test '#destroy is rejected while the user participates in an unfinished event' do
    user  = FactoryBot.create(:user)
    event = FactoryBot.create(:event, start_at: 2.days.from_now, end_at: 3.days.from_now)
    Ticket.create!(user: user, event: event)

    assert_not(user.destroy)
    assert_includes(user.errors.full_messages, '未終了の参加イベントが存在します。')
  end

  test '#destroy keeps the record in the database when it is rejected' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:event, owner: user, start_at: 2.days.from_now, end_at: 3.days.from_now)
    user.destroy

    assert(User.exists?(user.id))
  end

  # Known bug: `check_all_events_finished` ends with `throw(:abort) if errors`,
  # and `errors` is an ActiveModel::Errors object, which is truthy even when it
  # holds no error. Every destruction is therefore aborted — including the ones
  # the guard is meant to let through — so no user can ever be deleted and
  # RetirementsController#create can never complete. The guard would only work
  # as intended if it read `if errors.any?`.
  test '#destroy is rejected even when the user has no events at all' do
    user = FactoryBot.create(:user)

    assert_not(user.destroy)
    assert_empty(user.errors.full_messages)
  end

  test '#destroy is rejected even when every event of the user has finished' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:event, owner: user, start_at: 3.days.ago, end_at: 2.days.ago)

    assert_not(user.destroy)
    assert_empty(user.errors.full_messages)
  end

  test '#destroy! raises because the destruction is always aborted' do
    user = FactoryBot.create(:user)

    assert_raises(ActiveRecord::RecordNotDestroyed) { user.destroy! }
  end

  private

  # @rbs return: Hash[Symbol, untyped]
  def auth_hash(provider: 'github', uid: '12345', nickname: 'Oasist', image: 'http://example.com/oasist.jpg')
    {
      provider: provider,
      uid: uid,
      info: { nickname: nickname, image: image }
    }
  end
end
