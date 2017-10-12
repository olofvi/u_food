class Menu < ApplicationRecord
  has_many :menu_lines
  has_many :dishes, through: :menu_lines
  validates :name, presence: true
end
