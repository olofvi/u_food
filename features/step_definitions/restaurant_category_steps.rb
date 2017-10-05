Then("I click {string} button") do |button|
  click_link_or_button button
end

Then("show me the page") do
  save_and_open_page
end
