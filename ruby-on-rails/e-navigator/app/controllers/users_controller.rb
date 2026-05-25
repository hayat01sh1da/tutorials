# frozen_string_literal: true
# rbs_inline: enabled

# Lists all users (excluding the signed-in user) and shows their profile pages.
class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.where.not(id: current_user.id).order(id: 'asc')
  end

  # GET /users/:id
  def show
    @user = User.find(params.expect(:id))
  end
end
