require 'test_helper'

class ReviewsInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
def setup
    @user = users(:Admin)
  end



  test "review sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "#{FILL_IN} reviews", response.body
    # User with zero reviews
    other_user = users(:User2)
    log_in_as(other_user)
    get root_path
    assert_match "0 reviews", response.body
    other_user.reviews.create!(content: "A review")
    get root_path
    assert_match FILL_IN, response.body
  end

end
