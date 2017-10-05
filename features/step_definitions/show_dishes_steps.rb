Given("the following dishes exists") do |table|
  table.hashes.each do |hash|
    Dish.create!(hash)
  end
end

Given("I visit the dish page") do
  visit restaurant_path(:id)
end