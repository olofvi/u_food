# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if DishCategory.count == 0
  puts "Seeding section data..."
  %w(Starter Main Dessert).each do |name|
    DishCategory.create!(name: name)
  end
else
  puts "You already have some Dish Category data"
end
