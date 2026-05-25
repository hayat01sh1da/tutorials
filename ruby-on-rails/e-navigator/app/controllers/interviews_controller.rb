# frozen_string_literal: true
# rbs_inline: enabled

# Manages interview creation, editing, approval, and the apply/approve mailer flow.
class InterviewsController < ApplicationController
  before_action :set_user, only: %i[index new create select_approver]
  before_action :set_interview, only: %i[edit update destroy approve]

  # GET /users/:user_id/interviews
  def index
    @interviews = @user.interviews.order(datetime: 'asc')
    @approved_interview = @interviews.find_by(status: 1)
    # form_tag用に他ユーザー情報を代入します
    @email = User.where.not(id: current_user.id).pluck(:email)
  end

  # GET /users/:user_id/interviews/new
  def new
    @interview = Interview.new
  end

  # GET /users/:user_id/interviews/:id/edit
  def edit; end

  # POST /users/:user_id/interviews
  def create
    return redirect_with_forbidden(:forbidden_create) unless current_user?(@user.id)

    @interview = @user.interviews.new(interview_params)
    if @interview.save
      flash[:notice] = I18n.t('interviews.flash.created')
      redirect_to user_interviews_path
    else
      render :new
    end
  end

  # PATCH /users/:user_id/interviews/:id
  def update
    return redirect_with_forbidden(:forbidden_update) unless current_user?(@interview.user_id)

    @interview.update(interview_params)
    flash[:notice] = I18n.t('interviews.flash.updated')
    redirect_to user_interviews_path
  end

  # DELETE /users/:user_id/interviews/:id
  def destroy
    @interview.destroy
    flash[:notice] = I18n.t('interviews.flash.destroyed')
    redirect_to user_interviews_path
  end

  # POST /users/:user_id/interviews/select_approver
  def select_approver
    @approver = User.find_by(email: approver_params[:email])
    # Mailerの名前を変更しました
    InterviewMailer.apply(@user, @approver).deliver_now
    flash[:notice] = I18n.t('interviews.flash.applied')
    redirect_to user_interviews_path
  end

  # POST /users/:user_id/interviews/:id/approve
  def approve
    if @interview.datetime < DateTime.now
      flash[:notice] = I18n.t('interviews.flash.past_datetime_rejected')
    else
      finalize_approval
      flash[:notice] = I18n.t('interviews.flash.approved')
    end
    redirect_to user_interviews_path
  end

  private

  # @rbs return: void
  def finalize_approval
    @interview.approved!
    decline_other_interviews
    @approver = current_user
    # Mailerの名前を変更しました
    InterviewMailer.approve(@approver, @interview).deliver_now
  end

  # @rbs return: void
  def decline_other_interviews
    other_interviews = Interview.where(user_id: @interview.user_id).where.not(id: @interview.id)
    other_interviews.each do |interview|
      interview.declined!
    rescue ActiveRecord::RecordInvalid
      # Skip interviews that can't be declined
    end
  end

  # @rbs message_key: Symbol
  # @rbs return: void
  def redirect_with_forbidden(message_key)
    flash[:notice] = I18n.t("interviews.flash.#{message_key}")
    redirect_to users_path
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_interview
    @interview = Interview.find(params.expect(:id))
  end

  def interview_params
    params.expect(interview: [:datetime])
  end

  def approver_params
    params.permit(:email)
  end

  def current_user?(id)
    current_user.id == id
  end
end
