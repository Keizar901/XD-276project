require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

def setup
    @user = User.new(fname: "FirstName", lname: "LastName", email: "user@example.com",
     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "First name should be present" do
    @user.fname = ""
    assert_not @user.valid?
  end

  test "Last name should be present" do
    @user.lname = ""
    assert_not @user.valid?
  end

  test "The email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "First name should not be too long" do
    @user.fname = "a" * 21
    assert_not @user.valid?
  end

  test "Last name should not be too long" do
    @user.lname = "a" * 21
    assert_not @user.valid?
  end

  test "The email should not be too long" do
    @user.email = "a" * 500 + "@example.com"
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

    test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

    test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated reviews should be destroyed" do
    @user.save
    @user.reviews.create!(content: "Hello")
    assert_difference 'Review.count', -1 do
      @user.destroy
    end
  end



test "feed should have the right posts" do
    Admin = users(:Admin)
    User1  = users(:User1)
    User2    = users(:User2)
    # Posts from followed user
    User2.reviews.each do |post_following|
      assert Admin.feed.include?(post_following)
    end
    # Posts from self
    Admin.reviews.each do |post_self|
      assert Admin.feed.include?(post_self)
    end
    # Posts from unfollowed user
    User1.reviews.each do |post_unfollowed|
      assert_not Admin.feed.include?(post_unfollowed)
    end
  end
end
