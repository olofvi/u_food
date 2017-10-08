Given("the following restaurants exist") do |table|
  table.hashes.each do |hash|
    res_category = RestaurantCategory.find { |category| category.name == hash[:restaurant_category]}
    hash.delete_if {|key, value| value == res_category.name }
    restaurant = FactoryGirl.create(:restaurant, hash)
    res_category.update(restaurants: [restaurant])
  end
end

Given("I click {string}") do |link|
  click_link_or_button link
end
