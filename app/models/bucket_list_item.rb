class BucketListItem < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  belongs_to :vacation

  def attractions_names
    self.attractions.map(&:name).sort.join(", ")
  end

  def validate_name
    if current_user.bucket_list_items.where(name: self.name).exist?
       error.add(:name, 'has already been taken')
    end
  end
end
