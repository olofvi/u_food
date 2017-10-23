Given("I add comment {string}") do |comment|
  fill_in('Comment', with: comment)
end

Then("I click {string} stars") do |int|
  page.execute_script("$('#rating-form').raty('score', #{int.to_i});")
end

And(/^the last rating for "([^"]*)" should be "([^"]*)"$/) do |restaurant_name, rating_value|
  rest = Restaurant.find_by(name: restaurant_name)
  rating = rest.reviews.last.rating
  expect(rating).to eq rating_value.to_i
end