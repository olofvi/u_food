class RestaurantsController < ApplicationController
  before_action :find_cart

  def index
    @categories = RestaurantCategory.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus
    @dishes = @restaurant.dishes
    @dish_categories = @restaurant.dish_categories
    if params[:dish_category_id].present?
      @current_dish_category = DishCategory.find(params[:dish_category_id])
    end
  end
end

