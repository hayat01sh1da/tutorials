# frozen_string_literal: true
# rbs_inline: enabled

# Lets a signed-in user delete their account and ends their session.
class RetirementsController < ApplicationController
  def new; end

  def create
    return unless current_user.destroy

    reset_session
    redirect_to root_path, notice: I18n.t('flash.retirements.retired')
  end
end
