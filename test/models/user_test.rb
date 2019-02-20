require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example user", email: "mail@mail.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "name can't be null" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name must have at least three characters" do
    @user.name = "aa"
    assert_not @user.valid?
  end

  test "name can't be blank" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "name can't be too long" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email can't be null" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email can't be blank" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "email can't have too many characters" do
    @user.email = 'a' * 251
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email must be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password can't be null" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password must be longer than 5 characters" do
    @user.password = @user.password_confirmation = '*' * 5
    assert_not @user.valid?
  end

end
