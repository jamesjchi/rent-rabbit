class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.create review_params do |r|
      r.reviewer_id = params[:user_id]
      r.save
    end
    @path = User.find params[:user_id]

    if @review.save
      flash[:success] = "You left a review"
      redirect_to user_path(@path)
    else
      flash[:danger] = "Ratings between 1 and 5 only."
      redirect_to user_path(@path)
    end
  end

  def show
  end

  private

  def review_params
    params.permit(:rating, :review, :first_name, :last_name)
  end
end
