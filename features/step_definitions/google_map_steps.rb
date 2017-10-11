Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
  :js_error: false
end

And(/^(?:I expect a Google map to load|the map has been loaded)$/) do
  sleep(0.1) until page.evaluate_script('$.active') == 0
  expect(page).to have_css '#map .gm-style'
end
