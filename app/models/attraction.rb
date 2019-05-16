class Attraction < ApplicationRecord
  has_many :vacation_attractions
  has_many :vacations, through: :vacation_attractions

  has_many :attraction_categories
  has_many :categories, through: :attraction_categories
  
  validates :name, presence: true, uniqueness: true
end
