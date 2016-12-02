require 'test_helper'

class ReviewsInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
def setup
    @user = users(:Admin)
  end

  test "review interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Review.count' do
      post reviews_path, params: { review: { content: "" } }
    end

    assert_select 'div#error_explanation'
    # Valid submission
    content = "This review is valid."
    assert_difference 'Review.count', 1 do
      post reviews_path, params: { review: { content: content } }
    end

    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_review = @user.reviews.paginate(page: 1).first
    assert_difference 'Review.count', -1 do
      delete review_path(first_review)
    end
    # Visit different user (no delete links)
    get user_path(users(:User1))
    assert_select 'a', text: 'delete', count: 0
  #end

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
