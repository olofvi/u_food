Given("the following restaurants exist") do |table|
  table.hashes.each do |hash|
    restaurant = FactoryGirl.create(:restaurant, hash.except(:restaurant_category))
    res_category = RestaurantCategory.find(hash[:restaurant_category])
    res_category.update(restaurants: [restaurant])
  end
end

Given("I click {string}") do |link|
  click_link_or_button link
end
