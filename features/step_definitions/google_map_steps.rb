And(/^(?:I expect a Google map to load|the map has been loaded)$/) do
  sleep(5) until page.evaluate_script('$.active') == 0
  expect(page).to have_css '#map .gm-style'
end

Given("my location is set to {string} lat and {string} lng") do |lat, lng|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the center of the map should be approximately {string} lat and {string} lng") do |lat, lng|
  ACCEPTED_OFFSET = 0.2
  center_lat = page.evaluate_script('map.getCenter().lat();')
  center_lng = page.evaluate_script('map.getCenter().lng();')
  expect(center_lat).to be_within(ACCEPTED_OFFSET).of(lat.to_f)
  expect(center_lng).to be_within(ACCEPTED_OFFSET).of(lng.to_f)
end
