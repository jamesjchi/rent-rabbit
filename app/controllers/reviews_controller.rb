class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.create review_params do |r|
      r.reviewer_id = params[:user_id]
      r.save
    end
    if @review.save
      flash[:success] = "You left a review"
      redirect_to user_url(params => params[:user_id])
    end
    messages = @item.errors.map { |k, v| "#{k} #{v}" }
    flash[:danger] = messages.join(', ').gsub!(/_/, ' ')
    redirect_to user_url(params => params[:user_id])
  end

  def show
  end

  private

  def review_params
    params.permit(:rating, :review)
  end
end
