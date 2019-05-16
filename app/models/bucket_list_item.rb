class BucketListItem < ApplicationRecord
  belongs_to :user
  belongs_to :vacation, optional: true
  has_many :bucket_attractions
  accepts_nested_attributes_for :bucket_attractions
  has_many :attractions, through: :bucket_attractions
  validates :title, presence: true, uniqueness: true

  def attractions_names
    self.attractions.map(&:name).sort.join(", ")
  end


end
