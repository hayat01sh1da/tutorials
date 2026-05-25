# frozen_string_literal: true
# rbs_inline: enabled

# Base controller wiring up authentication, the current_user helper, and
# pagination-state persistence shared by every controller.
class ApplicationController < ActionController::Base
  # Raised (and rescued by Rails as a 404) when a route is reached in an
  # invalid state — e.g. an authenticated user hitting TicketsController#new.
  class RoutingError < StandardError; end

  before_action :authenticate
  helper_method :logged_in?, :current_user

  private

  def logged_in?
    # Return false in case of false and nil
    # Otherwise, return true
    !!current_user
  end

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate
    return if logged_in?

    redirect_to root_path, alert: I18n.t('flash.require_login')
  end

  def paginate_per
    session[:paginate_per] = params[:per] if params[:per].present?
  end

  def keep_last_pagination_data
    session[:last_pagination_data] = {
      params: request.query_parameters,
      controller: controller_name,
      action: action_name
    }
  end

  def load_pagination_params(action)
    data = session[:last_pagination_data].presence
    return unless data['controller'] == controller_name && data['action'] == action.to_s

    session[:last_pagination_data] = nil
    data['params']
  end

  def redirect_with_kept_pagination_params(action:, **args)
    redirect_to({ action:, params: load_pagination_params(action) }, args)
  end
end
