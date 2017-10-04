Given("I navigate to the index page") do
  visit root_path
end

Then("I should see welcome message {string}") do |message|
  expect(page).to have_content message
end
