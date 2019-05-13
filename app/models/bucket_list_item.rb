class BucketListItem < ApplicationRecord
  belongs_to :traveler
  belongs_to :attraction
  belongs_to :vacation
  validates :title, presence: true, uniqueness: true
end
