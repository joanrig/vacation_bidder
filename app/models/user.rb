class user < ApplicationRecord
  has_secure_password
  has_many :bucket_list_items
  has_many :bucket_attractions, through: :bucket_list_items
  has_many :attractions, through: :bucket_attractions
  has_many :vacations, through: :bucket_list_items
  validates :name, presence: true, uniqueness: true
end
