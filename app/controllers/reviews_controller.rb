class ReviewsController < ApplicationController
  def new
  end

  def create
    Review.creat review_params do |r|

      r.save
    end
    redirect_to root_path
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:rating, :review, :reviewer_id)
  end
end
