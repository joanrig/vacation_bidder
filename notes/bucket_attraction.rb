class BucketAttraction < ApplicationRecord
  belongs_to :bucket_list_item
  belongs_to :attraction
end
