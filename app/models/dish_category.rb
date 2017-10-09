class DishCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
