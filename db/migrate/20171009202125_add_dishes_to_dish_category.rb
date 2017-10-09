class AddDishesToDishCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :dish_categories, :dishes, foreign_key: true
  end
end
