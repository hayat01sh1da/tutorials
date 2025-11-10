require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1990, 1, 1)
    )
  end

  test "should redirect to sign in when not authenticated" do
    get users_url
    assert_redirected_to new_user_session_path
  end

  test "should allow access when authenticated" do
    sign_in @user
    get users_url
    assert_response :success
  end

  test "should configure permitted parameters for sign up" do
    # Test that sign up accepts the custom parameters
    assert_difference('User.count', 1) do
      post user_registration_url, params: {
        user: {
          name: "New User",
          email: "newuser@example.com",
          password: "password123",
          password_confirmation: "password123",
          birthday: Date.new(1995, 3, 15),
          sex: :male,
          school: "New School"
        }
      }
    end
  end

  test "should protect from forgery" do
    # CSRF protection should be enabled
    assert_includes ApplicationController._process_action_callbacks.map(&:filter), :verify_authenticity_token
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
