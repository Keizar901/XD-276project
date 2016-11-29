require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "User Id should be present" do
    @user.fname = ""
    assert_not @user.valid?
  end
end
