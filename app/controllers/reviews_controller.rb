class ReviewsController < ApplicationController
  def new
  end

  def create
    Review.creat review_params do |r|

      r.save
    end
    redirect_to user_show_path
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:rating, :review)
  end
end
