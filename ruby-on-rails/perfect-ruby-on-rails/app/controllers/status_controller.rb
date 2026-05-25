# frozen_string_literal: true
# rbs_inline: enabled

# Renders the public app-status page (used by health checks).
class StatusController < ApplicationController
  skip_before_action :authenticate

  def index; end
end
