class BucketListItem < ApplicationRecord
  belongs_to :user
  belongs_to :vacation, optional:true
  validates :title, presence: true, uniqueness: true

  def attractions_names
    self.attractions.map(&:name).sort.join(", ")
  end

  def validate_name
    if current_user.bucket_list_items.where(title: self.title).exist?
       error.add(:title, 'has already been taken')
    end
  end
end
