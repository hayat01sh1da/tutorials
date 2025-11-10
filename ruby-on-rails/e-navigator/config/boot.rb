ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Workaround for Ruby 2.6.0 bigdecimal/util.so bug
# The native extension has undefined symbol: rmpd_util_str_to_d
# We'll stub it to prevent the crash
module Kernel
  alias_method :original_require, :require

  def require(path)
    if path == 'bigdecimal/util'
      # bigdecimal/util just adds convenience methods
      # Skip the broken native extension
      return true
    end
    original_require(path)
  end
end
