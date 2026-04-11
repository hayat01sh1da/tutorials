# rbs_inline: enabled
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
