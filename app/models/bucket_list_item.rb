class BucketListItem < ApplicationRecord
  belongs_to :user
  belongs_to :vacation

  validates :name, presence: true

  def attractions_names
    self.attractions.map(&:name).sort.join(", ")
  end

  def validate_name
    if current_user.bucket_list_items.where(name: self.name).exist?
       error.add(:name, 'has already been taken')
    end
  end
end
