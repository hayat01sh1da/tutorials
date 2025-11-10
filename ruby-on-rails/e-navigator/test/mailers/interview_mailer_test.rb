require 'test_helper'

class InterviewMailerTest < ActionMailer::TestCase
  def setup
    @user = User.create!(
      name: "Test User",
      email: "user@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1990, 1, 1)
    )

    @approver = User.create!(
      name: "Approver User",
      email: "approver@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1985, 5, 15)
    )

    @interview = Interview.create!(
      user: @user,
      datetime: 2.days.from_now,
      status: :suspended
    )
  end

  # Apply email tests
  test "apply email should be sent to approver" do
    email = InterviewMailer.apply(@user, @approver)

    assert_difference 'ActionMailer::Base.deliveries.count', 1 do
      email.deliver_now
    end
  end

  test "apply email should have correct recipient" do
    email = InterviewMailer.apply(@user, @approver)

    assert_equal [@approver.email], email.to
  end

  test "apply email should have correct subject" do
    email = InterviewMailer.apply(@user, @approver)

    assert_equal "新規面接日時が登録されました", email.subject
  end

  test "apply email should contain user information" do
    email = InterviewMailer.apply(@user, @approver)

    assert_match @user.name, email.body.encoded
  end

  test "apply email should be from default sender" do
    email = InterviewMailer.apply(@user, @approver)

    assert_not_nil email.from
  end

  # Approve email tests
  test "approve email should be sent" do
    email = InterviewMailer.approve(@approver, @interview)

    assert_difference 'ActionMailer::Base.deliveries.count', 1 do
      email.deliver_now
    end
  end

  test "approve email should have correct recipient and cc" do
    email = InterviewMailer.approve(@approver, @interview)

    assert_equal [@interview.user.email], email.to
    assert_equal [@approver.email], email.cc
  end

  test "approve email should have correct subject" do
    email = InterviewMailer.approve(@approver, @interview)

    assert_equal "面接日時が確定しました", email.subject
  end

  test "approve email should contain interview information" do
    email = InterviewMailer.approve(@approver, @interview)

    assert_match @approver.name, email.body.encoded
  end

  test "approve email should contain approver information" do
    email = InterviewMailer.approve(@approver, @interview)

    body = email.body.encoded
    assert_match @approver.name, body
  end

  test "approve email should be from default sender" do
    email = InterviewMailer.approve(@approver, @interview)

    assert_not_nil email.from
  end

  # Test email content rendering
  test "apply email should render html template" do
    email = InterviewMailer.apply(@user, @approver)

    assert_match 'text/html', email.content_type
  end

  test "approve email should render html template" do
    email = InterviewMailer.approve(@approver, @interview)

    assert_match 'text/html', email.content_type
  end
end
