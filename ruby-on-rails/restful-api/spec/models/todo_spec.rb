# frozen_string_literal: true
# rbs_inline: enabled

require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Todo do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { is_expected.to have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and user_id are present before saving
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:user_id) }
end
