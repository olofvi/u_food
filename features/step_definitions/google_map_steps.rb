And(/^(?:I expect a Google map to load|the map has been loaded)$/) do
  sleep(5) until page.evaluate_script('$.active') == 0
  expect(page).to have_css '#map .gm-style'
end

Then("my location is where the center of the map should approximately be: {string} lat and {string} lng") do |lat, lng|
  ACCEPTED_OFFSET = 0.2
  center_lat = page.evaluate_script('map.getCenter().lat();')
  center_lng = page.evaluate_script('map.getCenter().lng();')
  expect(center_lat).to be_within(ACCEPTED_OFFSET).of(lat.to_f)
  expect(center_lng).to be_within(ACCEPTED_OFFSET).of(lng.to_f)
end

Then("I should see a pin on the map") do
  # expect(page).to have_selector('#markers img', count: 1)
  # expect(page).to have_xpath "//script[contains(., 'addMarker')]", visible: false
end