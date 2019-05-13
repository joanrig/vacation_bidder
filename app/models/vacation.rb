class Vacation < ApplicationRecord
  has_many :bucket_list_items
  has_many :travelers, through: :bucket_list_items
  has_many :attractions, through: :bucket_list_items
end
