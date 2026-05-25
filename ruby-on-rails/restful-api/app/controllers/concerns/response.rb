# frozen_string_literal: true
# rbs_inline: enabled

# Tiny controller concern that wraps render json with a default :ok status.
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
