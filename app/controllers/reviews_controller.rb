class ReviewsController < ApplicationController

before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user,   only: :destroy

  def create
  	@review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"      
    else
      flash[:danger] = "Review can't be blank!"
      @feed_items = []      
    end
    redirect_to random_reviews_path
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || random_reviews_path
  end

  private

    def review_params
      params.require(:review).permit(:content)
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to random_reviews_path if @review.nil?
    end

end
