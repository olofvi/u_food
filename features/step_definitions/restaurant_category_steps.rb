Given("the following table exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:category, hash)
  end
end
