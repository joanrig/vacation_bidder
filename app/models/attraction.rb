class Attraction < ApplicationRecord
  has_many :vacation_attractions
  has_many :vacations, through: :vacation_attractions

  has_many :attraction_categories
  has_many :categories, through: :attraction_categories
  accepts_nested_attributes_for :attraction_categories

  has_many :user_attractions
  accepts_nested_attributes_for :user_attractions
  has_many :users, through: :user_attractions

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true


  # def autosave_associated_records_for_attraction_categories
  #   # Find or create the author by name
  #   if new_author = Author.find_by_name(author.name)
  #     self.author = new_author
  #   else
  #     self.author.save!
  #   end
  # end
end
