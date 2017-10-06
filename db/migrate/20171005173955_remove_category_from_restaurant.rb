class RemoveCategoryFromRestaurant < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :category, :string
  end
end
