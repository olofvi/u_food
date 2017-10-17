Given("I navigate to the index page") do
  # binding.pry
  visit root_path
end

Then("I should see {string}") do |message|
  expect(page).to have_content message
end
