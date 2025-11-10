require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Test User",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      birthday: Date.new(1990, 1, 1),
      sex: :male,
      school: "Test University"
    )
  end

  # Validations
  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  test "should require email" do
    @user.email = nil
    assert_not @user.valid?
    assert_includes @user.errors[:email], "を入力してください"
  end

  test "should require password" do
    user = User.new(email: "test@example.com")
    assert_not user.valid?
  end

  test "should not allow future birthday" do
    @user.birthday = Date.tomorrow
    assert_not @user.valid?
    assert_includes @user.errors[:birthday], "に未来の日時は選択できません。"
  end

  test "should allow past birthday" do
    @user.birthday = Date.new(1990, 5, 15)
    assert @user.valid?
  end

  test "should allow today as birthday" do
    @user.birthday = Date.today
    assert @user.valid?
  end

  # Associations
  test "should have many interviews" do
    @user.save
    interview1 = @user.interviews.create(datetime: 1.day.from_now)
    interview2 = @user.interviews.create(datetime: 2.days.from_now)

    assert_equal 2, @user.interviews.count
    assert_includes @user.interviews, interview1
    assert_includes @user.interviews, interview2
  end

  test "should destroy associated interviews when user is destroyed" do
    @user.save
    @user.interviews.create(datetime: 1.day.from_now)
    @user.interviews.create(datetime: 2.days.from_now)

    assert_difference 'Interview.count', -2 do
      @user.destroy
    end
  end

  # Enum
  test "should have sex enum with correct values" do
    assert_equal 0, User.sexes[:unchosen]
    assert_equal 1, User.sexes[:male]
    assert_equal 2, User.sexes[:female]
  end

  test "should default to unchosen sex" do
    user = User.new(email: "new@example.com", password: "password123")
    assert_equal "unchosen", user.sex
  end

  test "should allow setting sex to male" do
    @user.sex = :male
    assert_equal "male", @user.sex
  end

  test "should allow setting sex to female" do
    @user.sex = :female
    assert_equal "female", @user.sex
  end

  # Methods
  test "age should calculate correctly" do
    @user.birthday = 25.years.ago.to_date
    @user.save
    assert_equal 25, @user.age
  end

  test "age should calculate correctly for recent birthday" do
    # Someone born 25 years and 6 months ago
    @user.birthday = 25.years.ago.to_date - 6.months
    @user.save
    assert_equal 25, @user.age
  end

  test "age should handle nil birthday" do
    @user.birthday = nil
    @user.save(validate: false)
    # The age method should return nil if birthday is not set
    result = @user.age
    assert_nil result
  end

  test "update_without_current_password should update user without password" do
    @user.save
    result = @user.update_without_current_password(
      name: "Updated Name",
      school: "Updated School"
    )

    assert result
    assert_equal "Updated Name", @user.name
    assert_equal "Updated School", @user.school
  end

  test "update_without_current_password should update password if provided" do
    @user.save
    result = @user.update_without_current_password(
      password: "newpassword123",
      password_confirmation: "newpassword123"
    )

    assert result
    assert @user.valid_password?("newpassword123")
  end

  test "update_without_current_password should ignore blank password" do
    @user.save
    old_encrypted_password = @user.encrypted_password

    result = @user.update_without_current_password(
      name: "Updated Name",
      password: "",
      password_confirmation: ""
    )

    assert result
    assert_equal "Updated Name", @user.name
    assert_equal old_encrypted_password, @user.reload.encrypted_password
  end
end
