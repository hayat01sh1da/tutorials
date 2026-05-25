# frozen_string_literal: true
# rbs_inline: enabled

# Handles the OmniAuth sign-in callback and the sign-out flow.
class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    user = User.find_or_create_from_auth_hash!(request.env['omniauth.auth'])
    session['user_id'] = user.id
    redirect_to root_path, notice: I18n.t('flash.sessions.signed_in')
  end

  def destroy
    reset_session
    redirect_to root_path, notice: I18n.t('flash.sessions.signed_out')
  end
end
