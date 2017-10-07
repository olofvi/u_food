FactoryGirl.define do
  factory :restaurant do
    sequence :name do |n|
      "person#{n}"
    end
    sequence :address do |n|
      "street #{n}"
    end
    association :restaurant_category
  end
end
