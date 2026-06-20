# frozen_string_literal: true
# rbs_inline: enabled

require 'rails_helper'

RSpec.describe 'Users API' do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before do
        post '/signup', params: valid_attributes.to_json, headers: headers
      end

      it 'creates a new user' do
        expect(response).to have_http_status(:created)
      end

      it 'returns a success message' do
        expect(json['message']).to include('Account created successfully')
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before do
        post '/signup', params: {}, headers: headers
      end

      it 'does not create a new user' do
        expect(response).to have_http_status(:unprocessable_content)
      end

      it 'returns a failure message' do
        expect(json['message'])
          .to include("Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank")
      end
    end
  end
end
