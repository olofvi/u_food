Given("the following dishes exists") do |table|
  table.hashes.each do |hash|
    Dish.create!(hash)
  end
end

Given("I visit the dish page") do
  visit '/restaurants/show'
end

Then("I should see the text {string}") do |text|
  expect(page).to have_content text
end
