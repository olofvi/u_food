class Dish < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :pic_url, presence: true
  validates :restaurant, presence: false
  validates :category, presence: false
end
