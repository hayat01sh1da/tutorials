# frozen_string_literal: true
# rbs_inline: enabled

module V2
  # Placeholder todos endpoint for the v2 API surface.
  class TodosController < ApplicationController
    def index
      # a dummy response
      json_response({ message: 'This is the verion 2 of Todos' })
    end
  end
end
