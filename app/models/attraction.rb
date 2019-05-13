class Attraction < ApplicationRecord
  has_many :bucket_attractions
  has_many :bucket_list_items, through: :bucket_attractions
  has_many :travelers, through: :bucket_list_items
  validates :name, presence: true, uniqueness: true
end
