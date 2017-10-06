Given("the following table exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:restaurant_category, hash)
  end
end
