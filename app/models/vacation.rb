class Vacation < ApplicationRecord
  has_many :bucket_list_items
  has_many :users, through: :bucket_list_items

  has_many :vacation_attractions
  accepts_nested_attributes_for :vacation_attractions
  has_many :attractions, through: :vacation_attractions

  #inverse_of : tells rails there is a relationship through foreign key and that it needs to be set on the nested model when saving your form data.
  #autosave: true saves parent record first so it has a parent_id to store in the nested attributes for the nested model.
  has_one :schedule, inverse_of: :vacation
  accepts_nested_attributes_for :schedule

  validates :name, presence: true, length: { maximum: 50, too_long: "Please choose a shorter name" }





  # validate :validate_name
  #
  # def validate_name
  #   if current_user.vacations.where(name: self.name).exist?
  #      error.add(:name, 'has already been taken')
  #   end
  # end




end
