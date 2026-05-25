# frozen_string_literal: true
# rbs_inline: enabled

require 'test_helper'

class ApplicationRecordTest < ActiveSupport::TestCase
  test 'should be abstract class' do
    assert_predicate ApplicationRecord, :abstract_class?
  end

  test 'should inherit from ActiveRecord::Base' do
    assert_operator ApplicationRecord, :<, ActiveRecord::Base
  end

  test 'User should inherit from ApplicationRecord' do
    assert_operator User, :<, ApplicationRecord
  end

  test 'Interview should inherit from ApplicationRecord' do
    assert_operator Interview, :<, ApplicationRecord
  end
end
