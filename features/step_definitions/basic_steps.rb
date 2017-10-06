Then("I should see the text {string}") do |text|
  expect(page).to have_content text
end

Then("I should see the picture {string}") do |pic_url|
  expect(page).to have_xpath("//img[@src='#{pic_url}']")
end

Then("I click on {string}") do |string|
  click_link_or_button string
end
