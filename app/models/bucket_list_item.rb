class BucketListItem < ApplicationRecord
  belongs_to :user
  belongs_to :vacation, optional: true
  validates :title, presence: true, uniqueness: true

  def attractions_names
    self.attractions.map(&:name).sort.join(", ")
  end


end
