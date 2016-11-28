require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
def setup
    @review = reviews(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Review.count' do
      post reviews_path, params: { review: { content: "Hello" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Review.count' do
      delete review_path(@review)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong review" do
    log_in_as(users(:Admin))
    review = reviews(:User1)
    assert_no_difference 'Review.count' do
      delete review_path(review)
    end
    assert_redirected_to root_url
  end


end
