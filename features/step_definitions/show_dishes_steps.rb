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

Then("I should see the picture {string}") do |pic_url|
  expect(page).to have_xpath("//img[@src='#{pic_url}']")
end

And(/^show me the page$/) do
  save_and_open_page
end