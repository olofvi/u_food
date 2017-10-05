Given("I click {string} link as a category") do |link|
  click_link_or_button link
end

Given("I see {string} category") do |category|
  expect(page).to have_content category
end

Then("I should see {string} under the category title") do |content|
  expect(page).to have_content content
end

Then("I should see {string} under the category") do |description|
  expect(page).to have_content description
end

Then("show me the page") do
  save_and_open_page
end
