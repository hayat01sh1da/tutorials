# frozen_string_literal: true
# rbs_inline: enabled

require 'rails_helper'

# Test suite for the Item model
RSpec.describe Item do
  # Association test
  # ensure an item record belongs to a single todo record
  it { is_expected.to belong_to(:todo) }
  # Validation test
  # ensure column name is present before saving
  it { is_expected.to validate_presence_of(:name) }
end
