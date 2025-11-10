require 'test_helper'

class ApplicationMailerTest < ActionMailer::TestCase
  # Test that ApplicationMailer is properly configured
  test "should have default from address" do
    # ApplicationMailer should be configured with a default from address
    assert_not_nil ApplicationMailer.default[:from]
  end
end
