class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :pic_url
      t.string :restaurant
      t.string :category

      t.timestamps
    end
  end
end
