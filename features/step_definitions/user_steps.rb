Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |item, content|
  fill_in item, with: content
end

Given("the following user exists") do |table|
  table.hashes.each do
    FactoryGirl.create(:user, password: 'password')
  end
  end

Given("the following user is signed in") do |table|
  table.hashes.each do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    end
  end