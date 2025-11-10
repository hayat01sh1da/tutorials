require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1990, 1, 1)
    )

    @other_user = User.create!(
      name: "Other User",
      email: "other@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1992, 5, 15)
    )

    @interview = Interview.create!(
      user: @user,
      datetime: 2.days.from_now,
      status: :suspended
    )

    sign_in @user
  end

  # Index action
  test "should get index" do
    get user_interviews_url(@user)
    assert_response :success
  end

  test "index should show interviews ordered by datetime" do
    interview2 = Interview.create!(user: @user, datetime: 1.day.from_now)
    interview3 = Interview.create!(user: @user, datetime: 3.days.from_now)

    get user_interviews_url(@user)
    assert_response :success

    interviews = assigns(:interviews)
    assert_equal 3, interviews.count
    assert_equal [interview2, @interview, interview3], interviews.to_a
  end

  test "index should set approved interview" do
    @interview.update(status: :approved)

    get user_interviews_url(@user)
    assert_response :success
    assert_equal @interview, assigns(:approved_interview)
  end

  test "index should provide email list for form" do
    get user_interviews_url(@user)
    assert_response :success

    emails = assigns(:email)
    assert_includes emails, @other_user.email
    assert_not_includes emails, @user.email
  end

  # New action
  test "should get new" do
    get new_user_interview_url(@user)
    assert_response :success
  end

  test "new should instantiate interview" do
    get new_user_interview_url(@user)
    assert_response :success
    assert_not_nil assigns(:interview)
    assert assigns(:interview).new_record?
  end

  # Create action
  test "should create interview" do
    assert_difference('Interview.count', 1) do
      post user_interviews_url(@user), params: {
        interview: { datetime: 3.days.from_now }
      }
    end

    assert_redirected_to user_interviews_path
    assert_equal "面接日時を登録しました", flash[:notice]
  end

  test "should not create interview with past datetime" do
    assert_no_difference('Interview.count') do
      post user_interviews_url(@user), params: {
        interview: { datetime: 1.day.ago }
      }
    end

    assert_response :success
    assert_template :new
  end

  test "should not create interview for other user" do
    delete destroy_user_session_path
    sign_in @other_user

    post user_interviews_url(@user), params: {
      interview: { datetime: 3.days.from_now }
    }

    assert_redirected_to users_path
    assert_equal "他のユーザーの面接日時の登録は許可されていません", flash[:notice]
  end

  # Edit action
  test "should get edit" do
    get edit_user_interview_url(@user, @interview)
    assert_response :success
  end

  test "edit should load correct interview" do
    get edit_user_interview_url(@user, @interview)
    assert_response :success
    assert_equal @interview, assigns(:interview)
  end

  # Update action
  test "should update interview" do
    new_datetime = 5.days.from_now

    patch user_interview_url(@user, @interview), params: {
      interview: { datetime: new_datetime }
    }

    assert_redirected_to user_interviews_path
    assert_equal "面接日時を変更しました", flash[:notice]

    @interview.reload
    assert_in_delta new_datetime.to_i, @interview.datetime.to_i, 1
  end

  test "should not update interview for other user" do
    delete destroy_user_session_path
    sign_in @other_user

    patch user_interview_url(@user, @interview), params: {
      interview: { datetime: 5.days.from_now }
    }

    assert_redirected_to users_path
    assert_equal "他のユーザーの面接日時の変更は許可されていません", flash[:notice]
  end

  # Destroy action
  test "should destroy interview" do
    assert_difference('Interview.count', -1) do
      delete user_interview_url(@user, @interview)
    end

    assert_redirected_to user_interviews_path
    assert_equal "面接日時を削除しました", flash[:notice]
  end

  test "should destroy correct interview" do
    interview2 = Interview.create!(user: @user, datetime: 1.day.from_now)

    assert_difference('Interview.count', -1) do
      delete user_interview_url(@user, @interview)
    end

    assert_nil Interview.find_by(id: @interview.id)
    assert_not_nil Interview.find_by(id: interview2.id)
  end

  # Select approver action
  test "should send apply email to approver" do
    assert_difference 'ActionMailer::Base.deliveries.count', 1 do
      post select_approver_user_interviews_url(@user), params: {
        email: @other_user.email
      }
    end

    assert_redirected_to user_interviews_path
    assert_equal "面接日時を申請しました", flash[:notice]
  end

  test "should find approver by email" do
    post select_approver_user_interviews_url(@user), params: {
      email: @other_user.email
    }

    assert_equal @other_user, assigns(:approver)
  end

  # Approve action
  test "should approve interview" do
    sign_in @other_user

    post approve_user_interview_url(@user, @interview)

    assert_redirected_to user_interviews_path
    assert_equal "面接日時を承認しました", flash[:notice]

    @interview.reload
    assert @interview.approved?
  end

  test "should decline other interviews when approving" do
    interview2 = Interview.create!(user: @user, datetime: 3.days.from_now, status: :suspended)
    interview3 = Interview.create!(user: @user, datetime: 4.days.from_now, status: :suspended)

    sign_in @other_user

    post approve_user_interview_url(@user, @interview)

    @interview.reload
    interview2.reload
    interview3.reload

    assert @interview.approved?
    assert interview2.declined?
    assert interview3.declined?
  end

  test "should send approve email" do
    sign_in @other_user

    assert_difference 'ActionMailer::Base.deliveries.count', 1 do
      post approve_user_interview_url(@user, @interview)
    end
  end

  test "should not approve past interview" do
    past_interview = Interview.create!(
      user: @user,
      datetime: 1.hour.from_now,
      status: :suspended
    )

    # Simulate time passing
    travel_to 2.hours.from_now do
      sign_in @other_user

      post approve_user_interview_url(@user, past_interview)

      assert_redirected_to user_interviews_path
      assert_equal "過去の日時を承認することは出来ません", flash[:notice]

      past_interview.reload
      assert_not past_interview.approved?
    end
  end

  private

  def sign_in(user)
    post user_session_url, params: {
      user: {
        email: user.email,
        password: 'password123'
      }
    }
  end
end
