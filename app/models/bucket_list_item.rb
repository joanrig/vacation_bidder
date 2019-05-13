class BucketListItem < ApplicationRecord
  belongs_to :traveler
  belongs_to :attraction
  belongs_to :vacation
end
