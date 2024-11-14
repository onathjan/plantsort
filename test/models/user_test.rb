require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email_address: "user@example.com", password: "foobar")
  end

  test "user should be valid" do
    assert @user.valid?, @user.errors.full_messages.to_sentence
  end
end

class EmailTests < UserTest
  test "email can't be blank" do
    @user.email_address = ""
    assert_not @user.valid?
  end

  test "email can't be too short" do
    @user.email_address = "j@x.com"
    assert_not @user.valid?
  end

  test "email can't be too long" do
    @user.email_address = "thisemailiswaaaaaaaaaaaaaaaaaaaytoolong@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email_address = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email_address = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email must be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be saved as lowercase" do
    @user.email_address = "UsEr@ExAmPlE.cOm"
    @user.save
    assert_equal @user.email_address, "user@example.com"
  end
end

class PasswordTests < UserTest
  test "password should be present" do
    @user.password = nil
    assert_not @user.valid?
  end

  test "password can't be blank" do
    @user.password = " " * 6
    assert_not @user.valid?
  end

  test "password can't be too short" do
    @user.password = "short"
    assert_not @user.valid?
  end
end
