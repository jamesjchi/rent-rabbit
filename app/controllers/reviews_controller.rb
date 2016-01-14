class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.create review_params do |r|
      r.reviewer_id = params[:user_id]
      r.save
    end
    if @review.save
      @path = User.find params[:user_id]
      flash[:success] = "You left a review"
      redirect_to user_path(@path)
    else
      messages = @review.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ').gsub!(/_/, ' ')
    end
  end

  def show
  end

  private

  def review_params
    params.permit(:rating, :review, :first_name, :last_name)
  end
end
