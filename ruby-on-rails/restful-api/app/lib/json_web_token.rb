# frozen_string_literal: true
# rbs_inline: enabled

# Encodes and decodes JWTs against the app's secret_key_base.
class JsonWebToken
  # secret to encode and decode token
  class JsonWebToken
  HMAC_SECRET =
    Rails.application.credentials.respond_to?(:secret_key_base) &&
      Rails.application.credentials.secret_key_base ||
    Rails.application.secret_key_base
end

  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hours from creation time
    payload[:exp] = exp.to_i
    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    # get payload; first index in decoded Array
    body = JWT.decode(token, HMAC_SECRET)[0]
    ActiveSupport::HashWithIndifferentAccess.new body
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end
