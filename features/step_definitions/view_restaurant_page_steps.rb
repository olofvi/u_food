Given("the following restaurants exist") do |table|
  x = 0
  @res_category = RestaurantCategory.all
  table.hashes.each do |hash|
    FactoryGirl.create(:restaurant, hash)
    restaurant = Restaurant.all[x]
    @res_category.all[x].update(restaurants: [restaurant])
    x += 1
  end
end

Given("I click {string}") do |link|
  click_link_or_button link
end
