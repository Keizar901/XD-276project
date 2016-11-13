require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    fname  = "First name"
    lname = "last name"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { fname:  fname,    										  
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal fname,  @user.fname    
    assert_equal email, @user.email
  end
end