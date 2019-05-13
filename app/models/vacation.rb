class Vacation < ApplicationRecord
  has_many :bucket_list_items
  has_many :travelers, through: :bucket_list_items
  has_many :bucket_attractions, through: :bucket_list_items
  validates :name, presence: true, uniqueness: true
end
