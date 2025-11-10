require 'test_helper'

class ApplicationRecordTest < ActiveSupport::TestCase
  test "should be abstract class" do
    assert ApplicationRecord.abstract_class?
  end

  test "should inherit from ActiveRecord::Base" do
    assert ApplicationRecord < ActiveRecord::Base
  end

  test "User should inherit from ApplicationRecord" do
    assert User < ApplicationRecord
  end

  test "Interview should inherit from ApplicationRecord" do
    assert Interview < ApplicationRecord
  end
end
