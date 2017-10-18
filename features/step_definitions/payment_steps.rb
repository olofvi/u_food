Then('I should be on cart page') do
  cart_path(Cart.ids, Restaurant.ids)
end

Given('I fill in my card details') do
  sleep(0.1) until page.evaluate_script('$.active') == 0
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in 'Email', with: 'random@morerandom.com'
    fill_in 'Card number', with: '4242 4242 4242 4242'
    fill_in 'CVC', with: '123'
    fill_in 'cc-exp', with: '12/2021'
  end
end

Then('I submit the stripe form') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I click Pay with Card stripe button$/) do
  sleep(0.1) until page.evaluate_script('$.active') == 0
  click_button '.stripe-button-el'
end