class ReviewsController < ApplicationController

  before_action :find_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.user = current_user

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
      flash[:warning] = 'Please choose a rating'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

