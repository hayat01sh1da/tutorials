# frozen_string_literal: true
# rbs_inline: enabled

# Routing constraint that matches when the request's Accept header asks for
# this API version, or when this version is marked as the default.
class ApiVersion
  attr_reader :version, :default

  def initialize(version, default: false)
    @version = version
    @default = default
  end

  # check whether version is specified or is default
  def matches?(request)
    check_headers?(request.headers) || default
  end

  private

  def check_headers?(headers)
    # check version from Accept headers; expect custom media type `todos`
    accept = headers[:accept]
    accept&.include?("application/vnd.todos.#{version}+json")
  end
end
