Given("the following dishes exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:dish, hash)
  end
end

Given("the following dish category exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:dish_category, hash)
  end
end

And(/^show me the page$/) do
  save_and_open_page
end