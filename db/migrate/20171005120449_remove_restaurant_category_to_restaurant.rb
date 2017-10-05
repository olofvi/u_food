class RemoveRestaurantCategoryToRestaurant < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :restaurant_category, :string
  end
end
