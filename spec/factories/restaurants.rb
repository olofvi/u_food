FactoryGirl.define do
  factory :restaurant do
    sequence :name do |n|
      "Restaurant#{n}"
    end
    sequence :address do |n|
      "street #{n}"
    end
    sequence :description do |n|
      "a restaurant #{n}"
    end
  end
end
