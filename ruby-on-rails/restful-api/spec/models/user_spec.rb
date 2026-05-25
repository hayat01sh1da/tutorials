# frozen_string_literal: true
# rbs_inline: enabled

require 'rails_helper'

# Test suite for User model
RSpec.describe User do
  # Association test
  # ensure User model has a 1:m relationship with the Todo model
  it { is_expected.to have_many(:todos) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password_digest) }
end
