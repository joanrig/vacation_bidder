class Vacation < ApplicationRecord
  has_many :bucket_list_items
  has_many :users, through: :bucket_list_items

  has_many :vacation_attractions
  accepts_nested_attributes_for :vacation_attractions
  has_many :attractions, through: :vacation_attractions

  validates :name, presence: true
  #validate :validate_name

  # def validate_name
  #   if current_user.vacations.where(name: self.name).exist?
  #      error.add(:name, 'has already been taken')
  #   end
  # end

end
