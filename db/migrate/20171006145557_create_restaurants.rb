class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.belongs_to :restaurant_category, index: true

      t.timestamps
    end
  end
end
