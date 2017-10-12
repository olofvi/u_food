FactoryGirl.define do
  factory :menu do
    name "MyString"
  end

  factory :menu_with_dishes, :parent => :menu do |restaurant|
    dishes { create_list :dish, 3 }

  end

end
