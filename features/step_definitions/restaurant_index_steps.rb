Given("I visit the {string} page") do |page|
  visit page
end

Then("I should see welcome message {string}") do |message|
  expect(page).to have_content message
end
