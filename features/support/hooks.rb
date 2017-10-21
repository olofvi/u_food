Before '@stripe' do
  StripeMock.start
end

After '@stripe' do
  StripeMock.stop
end

Before do
  Capybara.current_driver = :poltergeist
  page.driver.browser.js_errors = false
end

# Before do
#   Aws.config[:s3] = {stub_responses: true}
# end