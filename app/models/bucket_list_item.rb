class BucketListItem < ApplicationRecord
  belongs_to :traveler
  belongs_to :vacation, optional: true
  has_many :bucket_attractions
  has_many :attractions, through: :bucket_attractions
  validates :title, presence: true, uniqueness: true
end
