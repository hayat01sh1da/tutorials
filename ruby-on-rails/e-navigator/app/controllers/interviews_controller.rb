class InterviewsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :select_approver]
  before_action :set_interview, only: [:edit, :update, :destroy, :approve]

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

  # POST /users/:user_id/interviews
  def create
    unless current_user?(@user.id)
      flash[:notice] = "他のユーザーの面接日時の登録は許可されていません"
      redirect_to users_path
    else
      @interview = @user.interviews.new(interview_params)
      if @interview.save
        flash[:notice] = "面接日時を登録しました"
        redirect_to user_interviews_path
      else
        render :new
      end
    end
  end

  # GET /users/:user_id/interviews/:id/edit
  def edit
  end

  # PATCH /users/:user_id/interviews/:id
  def update
    unless current_user?(@interview.user_id)
      flash[:notice] = "他のユーザーの面接日時の変更は許可されていません"
      redirect_to users_path
    else
      @interview.update(interview_params)
      flash[:notice] = "面接日時を変更しました"
      redirect_to user_interviews_path
    end
  end

  # DELETE /users/:user_id/interviews/:id
  def destroy
    @interview.destroy
    flash[:notice] = "面接日時を削除しました"
    redirect_to user_interviews_path
  end

  # POST /users/:user_id/interviews/select_approver
  def select_approver
    @approver = User.find_by(email: approver_params[:email])
    # Mailerの名前を変更しました
    InterviewMailer.apply(@user, @approver).deliver
    flash[:notice] = "面接日時を申請しました"
    redirect_to user_interviews_path
  end

  # POST /users/:user_id/interviews/:id/approve
  def approve
    if @interview.datetime < DateTime.now
      flash[:notice] = "過去の日時を承認することは出来ません"
      redirect_to user_interviews_path
    else
      @interview.approved!
      # 以下、承認した日時以外を否認状態にする
      interviews = Interview.where(user_id: @interview.user_id).where.not(id: @interview.id)
      interviews.each do |interview|
        interview.declined!
        rescue ActiveRecord::RecordInvalid
      end
      @approver = current_user
      # Mailerの名前を変更しました
      InterviewMailer.approve(@approver, @interview).deliver
      flash[:notice] = "面接日時を承認しました"
      redirect_to user_interviews_path
    end
  end

  private

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def set_interview
      @interview = Interview.find(params[:id])
    end

    def interview_params
      params.require(:interview).permit(:datetime)
    end

    # form_tagに変えたので、.require(:user)を削除しました
    def approver_params
      params.permit(:email)
    end

    def current_user?(id)
      current_user.id == id
    end
end
