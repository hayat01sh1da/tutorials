# frozen_string_literal: true
# rbs_inline: enabled

require 'test_helper'

class EventHelperTest < ActionView::TestCase
  tests EventHelper

  test '#show_image_if_attached renders nothing while no image is attached' do
    assert_nil(show_image_if_attached(FactoryBot.create(:event)))
  end

  test '#show_image_if_attached renders an img tag once an image is attached' do
    event = FactoryBot.create(:event)
    attach_image(event)

    assert_match(/<img /, show_image_if_attached(event))
  end

  test '#show_image_if_attached styles the thumbnail it renders' do
    event = FactoryBot.create(:event)
    attach_image(event)

    assert_match(/class="img-thumnail d-block mb-3"/, show_image_if_attached(event))
  end

  private

  # @rbs return: void
  def attach_image(event)
    event.image.attach(
      io: Rails.root.join('test/fixtures/files/event_image.png').open,
      filename: 'event_image.png',
      content_type: 'image/png'
    )
  end
end
