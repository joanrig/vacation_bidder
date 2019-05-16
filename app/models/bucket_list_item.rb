class BucketListItem < ApplicationRecord
  belongs_to :user
  has_many :bucket_vacations
  has_many :vacations, through: :bucket_vacations
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
