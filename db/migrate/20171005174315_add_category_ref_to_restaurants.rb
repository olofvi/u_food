class AddCategoryRefToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_reference :restaurants, :category, foreign_key: true
  end
end
