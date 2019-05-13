class Traveler < ApplicationRecord
  has_many :bucket_list_items
  has_many :attractions, through: :bucket_list_items
  has_many :vacations, through: :bucket_list_items
end
