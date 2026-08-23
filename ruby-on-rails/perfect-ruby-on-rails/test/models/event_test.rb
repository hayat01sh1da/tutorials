# frozen_string_literal: true
# rbs_inline: enabled

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'Argument ID of #created_by? is equal to owner_id' do
    user  = FactoryBot.create(:user)
    event = FactoryBot.create(:event, owner: user)

    assert(event.created_by?(user))
  end

  test 'Argument ID of #created_by? is not equal to owner_id' do
    event = FactoryBot.create(:event)
    user  = FactoryBot.create(:user)

    assert_not(event.created_by?(user))
  end

  test 'Argument ID of #created_by? is equal to nil' do
    event = FactoryBot.create(:event)

    assert_not(event.created_by?(nil))
  end

  test 'Validation of start_at_should_be_before_end_at is OK' do
    start_at = rand(1..30).days.from_now
    end_at   = start_at + rand(1..30).hours
    event    = FactoryBot.build(:event, start_at: start_at, end_at: end_at)
    event.valid?

    assert_empty(event.errors[:start_at])
  end

  test 'Validation of start_at_should_be_before_end_at is error' do
    start_at = rand(1..30).days.from_now
    end_at   = start_at - rand(1..30).hours
    event    = FactoryBot.build(:event, start_at: start_at, end_at: end_at)
    event.valid?

    assert_not_empty(event.errors[:start_at])
  end

  test 'start_at equal to end_at is an error because the comparison is not strict' do
    start_at = rand(1..30).days.from_now
    event    = FactoryBot.build(:event, start_at: start_at, end_at: start_at)
    event.valid?

    assert_not_empty(event.errors[:start_at])
  end

  test 'start_at and end_at are compared after being floored to the second' do
    start_at = Time.zone.now.change(usec: 400_000)
    end_at   = start_at.change(usec: 900_000)
    event    = FactoryBot.build(:event, start_at: start_at, end_at: end_at)
    event.valid?

    assert_not_empty(event.errors[:start_at])
  end

  test 'The presence of every required attribute is validated' do
    event = Event.new
    event.valid?

    %i[name place content start_at end_at].each do |attribute|
      assert_not_empty(event.errors[attribute], "#{attribute} should be required")
    end
  end

  test 'name is valid up to 50 characters and invalid beyond it' do
    assert_empty(build_with(name: 'あ' * 50).errors[:name])
    assert_not_empty(build_with(name: 'あ' * 51).errors[:name])
  end

  test 'place is valid up to 10000 characters and invalid beyond it' do
    assert_empty(build_with(place: 'あ' * 10_000).errors[:place])
    assert_not_empty(build_with(place: 'あ' * 10_001).errors[:place])
  end

  test 'content is valid up to 2000 characters and invalid beyond it' do
    assert_empty(build_with(content: 'あ' * 2000).errors[:content])
    assert_not_empty(build_with(content: 'あ' * 2001).errors[:content])
  end

  test '.default excludes the events that have already started' do
    past   = FactoryBot.create(:event, start_at: 3.days.ago, end_at: 2.days.ago)
    future = FactoryBot.create(:event, start_at: 2.days.from_now, end_at: 3.days.from_now)

    assert_includes(Event.default, future)
    assert_not_includes(Event.default, past)
  end

  test '.default orders the events by start_at and then by name' do
    later    = FactoryBot.create(:event, name: 'あとの回', start_at: 3.days.from_now, end_at: 4.days.from_now)
    second   = FactoryBot.create(:event, name: 'B', start_at: 2.days.from_now, end_at: 3.days.from_now)
    first    = FactoryBot.create(:event, name: 'A', start_at: 2.days.from_now, end_at: 3.days.from_now)
    expected = [first, second, later]

    assert_equal(expected, Event.default.where(id: expected.map(&:id)).to_a)
  end

  test '.ransackable_attributes exposes only the searchable columns' do
    assert_equal(%w[name place content start_at end_at], Event.ransackable_attributes)
  end

  test '#to_markdown renders the event as a markdown document' do
    event    = FactoryBot.create(:event)
    markdown = event.to_markdown

    assert_match(/\A# #{Regexp.escape(event.name)}\n/, markdown)
    assert_match(/- 主催者: #{Regexp.escape(event.owner.name)}$/, markdown)
    assert_match(/- 開催場所: #{Regexp.escape(event.place)}$/, markdown)
  end

  test '#to_markdown formats both timestamps in Japanese' do
    event = FactoryBot.create(:event)
    period = "#{event.start_at.strftime('%Y年%m月%d日 %H:%M:%S')} ~ #{event.end_at.strftime('%Y年%m月%d日 %H:%M:%S')}"

    assert_includes(event.to_markdown, "- 開催日時: #{period}")
  end

  test '#image_to_show? is false while no image is attached' do
    assert_not(FactoryBot.create(:event).image_to_show?)
  end

  test '#image_to_show? is true once an image is attached' do
    event = FactoryBot.create(:event)
    attach_image(event)

    assert_predicate(event, :image_to_show?)
  end

  test 'An attached png passes the image validations' do
    event = FactoryBot.build(:event)
    attach_image(event)
    event.valid?

    assert_empty(event.errors[:image])
  end

  test 'An attachment that is not an image is rejected' do
    event = FactoryBot.build(:event)
    event.image.attach(io: file_fixture_io('not_an_image.txt'), filename: 'not_an_image.txt',
                       content_type: 'text/plain')
    event.valid?

    assert_not_empty(event.errors[:image])
  end

  test 'remove_image detaches the image when it is set to a truthy value' do
    event = FactoryBot.create(:event)
    attach_image(event)
    event.update!(remove_image: '1')

    assert_not(event.reload.image.attached?)
  end

  test 'remove_image keeps the image when it is set to a falsy value' do
    event = FactoryBot.create(:event)
    attach_image(event)
    event.update!(remove_image: '0')

    assert_predicate(event.reload.image, :attached?)
  end

  test 'Destroying the event destroys its tickets' do
    event = FactoryBot.create(:event)
    Ticket.create!(user: FactoryBot.create(:user), event: event)

    assert_difference -> { Ticket.count } => -1 do
      event.destroy!
    end
  end

  private

  # @rbs return: untyped
  def build_with(**attributes)
    event = FactoryBot.build(:event, **attributes)
    event.valid?
    event
  end

  # @rbs return: untyped
  def file_fixture_io(filename)
    Rails.root.join('test/fixtures/files', filename).open
  end

  # @rbs return: void
  def attach_image(event)
    event.image.attach(io: file_fixture_io('event_image.png'), filename: 'event_image.png', content_type: 'image/png')
  end
end
