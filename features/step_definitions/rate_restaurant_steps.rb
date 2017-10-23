Given("I give Yappi a rating of {int}") do |int|
  fill_in('Rating', :with => int)
end

Given("I add comment {string}") do |string|
  fill_in('Comment', :with => 'decent restaurant')
end

Then("I click {string} stars") do |string|
binding.pry
  find("img[@alt='4']").trigger('click')
end