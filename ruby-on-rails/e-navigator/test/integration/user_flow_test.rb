require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      email: "user@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1990, 1, 1)
    )
  end

  test "user can sign up" do
    assert_difference 'User.count', 1 do
      post user_registration_path, params: {
        user: {
          name: "New User",
          email: "newuser@example.com",
          password: "password123",
          password_confirmation: "password123",
          birthday: Date.new(1995, 5, 15),
          sex: :male,
          school: "Test School"
        }
      }
    end

    assert_redirected_to root_path
  end

  test "user can sign in and out" do
    # Sign in
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password123"
      }
    }

    assert_redirected_to users_path

    # Sign out
    delete destroy_user_session_path
    assert_redirected_to root_path
  end

  test "user can view other users" do
    other_user = User.create!(
      name: "Other User",
      email: "other@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1992, 3, 10)
    )

    sign_in @user

    get users_path
    assert_response :success

    get user_path(other_user)
    assert_response :success
  end

  test "user can view their own profile" do
    sign_in @user

    get user_path(@user)
    assert_response :success
  end

  test "unauthenticated user is redirected to sign in" do
    get users_path
    assert_redirected_to new_user_session_path

    get user_path(@user)
    assert_redirected_to new_user_session_path
  end
end
