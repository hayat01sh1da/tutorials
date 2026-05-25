# frozen_string_literal: true
# rbs_inline: enabled

module Users
  # Devise-generated password reset endpoints.
  class PasswordsController < Devise::PasswordsController
    # GET /resource/password/new
    def new
      super
    end

    # GET /resource/password/edit?reset_password_token=abcdef
    def edit
      super
    end

    # POST /resource/password
    def create
      super
    end

    # PUT /resource/password
    def update
      super
    end

    protected

    def after_resetting_password_path_for(resource)
      super
    end

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      super
    end
  end
end
