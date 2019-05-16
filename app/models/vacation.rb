class Vacation < ApplicationRecord
  has_many :bucket_vacations
  has_many :bucket_list_items, through: :bucket_vacations

  has_many :vacation_attractions
  has_many :attractions, through: :vacation_attractions

  validates :name, presence: true
  validate :validate_name

  def validate_name
    if current_user.vacations.where(title: self.title).exist?
       error.add(:title, 'has already been taken')
    end
  end

end
