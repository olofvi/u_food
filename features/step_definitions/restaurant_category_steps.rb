Given("the following table exists") do |table|
  table.hashes.each do |item|
    Restaurant.create!(item)
  end
end

