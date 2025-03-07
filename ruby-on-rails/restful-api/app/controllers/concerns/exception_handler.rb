module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ActiveRecord::RecordNotFound, with: :four_zero_four
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(error)
    json_response({ message: error.message }, :unprocessable_entity)
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(error)
    json_response({ message: error.message }, :unauthorized)
  end

  # JSON response with message; Status code 404 - NotFound
  def four_zero_four(error)
    json_response({ message: error.message }, :not_found)
  end
end
