class AddRestaurantCategoryToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :restaurant_category, :string
  end
end
