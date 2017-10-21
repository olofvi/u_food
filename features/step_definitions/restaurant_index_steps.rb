Given("I navigate to the index page") do
  visit root_path
  steps %q{
    And the map has been loaded
        }
end

Then("I should see {string}") do |message|
  expect(page).to have_content message
end
