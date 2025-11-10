require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
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

    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "index should not include current user" do
    get users_url
    assert_response :success
    # Current user should not be in the list
    users = assigns(:users)
    assert_not_includes users, @user
    assert_includes users, @other_user
  end

  test "index should show users ordered by id" do
    get users_url
    assert_response :success
    assert_not_nil assigns(:users)
    # Verify users are ordered by id ascending
    users = assigns(:users)
    assert_equal users.sort_by(&:id), users.to_a
  end

  test "should get show" do
    get user_url(@other_user)
    assert_response :success
  end

  test "should show correct user" do
    get user_url(@other_user)
    assert_response :success
    assert_not_nil assigns(:user)
    assert_equal @other_user.id, assigns(:user).id
  end

  test "should be able to view own profile" do
    get user_url(@user)
    assert_response :success
    assert_equal @user.id, assigns(:user).id
  end

  private

end
