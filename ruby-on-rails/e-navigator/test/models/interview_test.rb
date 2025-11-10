require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1990, 1, 1)
    )
    @interview = Interview.new(
      user: @user,
      datetime: 1.day.from_now,
      status: :suspended
    )
  end

  # Validations
  test "should be valid with valid attributes" do
    assert @interview.valid?
  end

  test "should require user_id" do
    @interview.user = nil
    assert_not @interview.valid?
    assert_includes @interview.errors[:user_id], "を入力してください"
  end

  test "should not allow past datetime" do
    @interview.datetime = 1.day.ago
    assert_not @interview.valid?
    assert_includes @interview.errors[:datetime], "に過去の日時は選択できません。"
  end

  test "should allow future datetime" do
    @interview.datetime = 1.week.from_now
    assert @interview.valid?
  end

  test "should not allow current datetime" do
    @interview.datetime = Time.current
    assert_not @interview.valid?
  end

  # Associations
  test "should belong to user" do
    @interview.save
    assert_equal @user, @interview.user
  end

  test "should be able to access user through association" do
    @interview.save
    assert_equal @user.email, @interview.user.email
    assert_equal @user.name, @interview.user.name
  end

  # Enum
  test "should have status enum with correct values" do
    assert_equal 0, Interview.statuses[:suspended]
    assert_equal 1, Interview.statuses[:approved]
    assert_equal 2, Interview.statuses[:declined]
  end

  test "should default to suspended status" do
    interview = Interview.new(user: @user, datetime: 1.day.from_now)
    assert_equal "suspended", interview.status
  end

  test "should allow setting status to approved" do
    @interview.status = :approved
    assert_equal "approved", @interview.status
    assert @interview.approved?
  end

  test "should allow setting status to declined" do
    @interview.status = :declined
    assert_equal "declined", @interview.status
    assert @interview.declined?
  end

  test "should change status using bang methods" do
    @interview.save

    @interview.approved!
    assert_equal "approved", @interview.reload.status

    @interview.declined!
    assert_equal "declined", @interview.reload.status

    @interview.suspended!
    assert_equal "suspended", @interview.reload.status
  end

  # Edge cases
  test "should handle datetime exactly at current time" do
    @interview.datetime = DateTime.now
    # Should be invalid as it's not greater than current time
    assert_not @interview.valid?
  end

  test "should be invalid when datetime is nil" do
    @interview.datetime = nil
    # datetime is required, should be invalid if nil
    assert_not @interview.valid?
  end
end
