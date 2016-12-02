require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "User fname not valid" do
    @u = User.new
    @u.fname = ""
    @u.save
    assert_not @u.valid?
  end
end
