require 'test_helper'

class InterviewFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      email: "user@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1990, 1, 1)
    )

    @approver = User.create!(
      name: "Approver",
      email: "approver@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1985, 5, 15)
    )
  end

  test "complete interview workflow" do
    # User signs in
    sign_in @user

    # User creates an interview
    get new_user_interview_path(@user)
    assert_response :success

    assert_difference 'Interview.count', 1 do
      post user_interviews_path(@user), params: {
        interview: { datetime: 2.days.from_now }
      }
    end

    interview = Interview.last
    assert_equal @user, interview.user
    assert_equal "suspended", interview.status

    # User selects an approver
    assert_difference 'ActionMailer::Base.deliveries.count', 1 do
      post select_approver_user_interviews_path(@user), params: {
        email: @approver.email
      }
    end

    # Approver signs in
    sign_in @approver

    # Approver approves the interview
    assert_difference 'ActionMailer::Base.deliveries.count', 1 do
      post approve_user_interview_path(@user, interview)
    end

    interview.reload
    assert interview.approved?

    # User views approved interview
    sign_in @user
    get user_interviews_path(@user)
    assert_response :success
  end

  test "user creates multiple interviews and approver selects one" do
    sign_in @user

    # Create multiple interviews
    interview1 = nil
    interview2 = nil
    interview3 = nil

    assert_difference 'Interview.count', 3 do
      post user_interviews_path(@user), params: {
        interview: { datetime: 2.days.from_now }
      }
      interview1 = Interview.last

      post user_interviews_path(@user), params: {
        interview: { datetime: 3.days.from_now }
      }
      interview2 = Interview.last

      post user_interviews_path(@user), params: {
        interview: { datetime: 4.days.from_now }
      }
      interview3 = Interview.last
    end

    # Approver approves the second interview
    sign_in @approver
    post approve_user_interview_path(@user, interview2)

    # Check that only interview2 is approved, others are declined
    interview1.reload
    interview2.reload
    interview3.reload

    assert interview2.approved?
    assert interview1.declined?
    assert interview3.declined?
  end

  test "user cannot create interview for another user" do
    other_user = User.create!(
      name: "Other User",
      email: "other@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1992, 3, 10)
    )

    sign_in @user

    post user_interviews_path(other_user), params: {
      interview: { datetime: 2.days.from_now }
    }

    assert_redirected_to users_path
    assert_equal "他のユーザーの面接日時の登録は許可されていません", flash[:notice]
  end

  test "user can update their own interview" do
    sign_in @user

    interview = Interview.create!(
      user: @user,
      datetime: 2.days.from_now
    )

    new_datetime = 5.days.from_now

    patch user_interview_path(@user, interview), params: {
      interview: { datetime: new_datetime }
    }

    assert_redirected_to user_interviews_path(@user)
    interview.reload
    assert_in_delta new_datetime.to_i, interview.datetime.to_i, 1
  end

  test "user can delete their own interview" do
    sign_in @user

    interview = Interview.create!(
      user: @user,
      datetime: 2.days.from_now
    )

    assert_difference 'Interview.count', -1 do
      delete user_interview_path(@user, interview)
    end

    assert_redirected_to user_interviews_path(@user)
  end
end
