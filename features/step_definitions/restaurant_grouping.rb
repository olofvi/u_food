Given(/^I click on calendar link "([^"]*)"$/) do |data|
  scope = find("div[data-date='#{data}']")
  within scope do
    link = Time.parse(data).strftime('%H:%M')
    find('a', text: link).click
  end
end
