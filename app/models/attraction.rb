class Attraction < ApplicationRecord
  has_many :bucket_list_items
  has_many :travelers, through: :bucket_list_items
  has_many :vacations, through: :bucket_list_items
  validates :name, presence: true, uniqueness: true
end
