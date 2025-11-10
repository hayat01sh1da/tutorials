require 'test_helper'

class ApplicationJobTest < ActiveJob::TestCase
  # Test that ApplicationJob is properly configured
  test "should inherit from ActiveJob::Base" do
    assert ApplicationJob < ActiveJob::Base
  end
end
