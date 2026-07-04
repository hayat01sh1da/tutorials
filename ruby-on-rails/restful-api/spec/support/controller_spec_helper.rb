# frozen_string_literal: true
# rbs_inline: enabled

module ControllerSpecHelper
  # generate tokens from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired tokens from user id
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, Time.now.to_i - 10)
  end

  # return valid headers
  def valid_headers(version = nil)
    base_headers(token_generator(user.id), version)
  end

  # return invalid headers
  def invalid_headers(version = nil)
    base_headers(nil, version)
  end

  private

  # @rbs authorization: String?
  # @rbs version: String?
  # @rbs return: Hash[String, String?]
  def base_headers(authorization, version)
    headers = {
      'Authorization' => authorization,
      'Content-Type' => 'application/json'
    }
    headers['Accept'] = "application/vnd.todos.#{version}+json" if version
    headers
  end
end
