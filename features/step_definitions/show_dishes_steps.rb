Given("the following dishes exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:dish, hash)
  end
end

Given("I visit the restaurant page") do
  visit restaurant_path(:id)
end