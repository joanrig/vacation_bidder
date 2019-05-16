class BucketVacation < ApplicationRecord
  belongs_to :bucket_list_item
  belongs_to :vacation
end
