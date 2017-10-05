Then("I click a button “Add to order”") do
  click_link_or_button
end

Then("I should see a flash “Sushi rolls added to order”") do
  expect(page).to have_content
end

Then("I should see “{int} item in shopping cart”") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end