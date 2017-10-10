# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  RestaurantCategory.create([{
      name: Faker::Simpsons.character,
      description: Faker::FamilyGuy.quote
      }])

2.times do
    Restaurant.create([{
        name: Faker::StarWars.character,
        address: Faker::HitchhikersGuideToTheGalaxy.location
                        }])
    rest = Restaurant.last
    res_cat = RestaurantCategory.last
    rest.update_attribute(:restaurant_category, res_cat)
  end
end

5.times do
  Dish.create([{
                   name: Faker::Food.dish,
                   description: Faker::Hobbit.quote,
                   price: Faker::Number.between(5, 60),
                   pic_url: Faker::LoremPixel.image("200x200", false, 'food')
               }])
end