class Category < ApplicationRecord
  has_many :attraction_categories
  has_many :attractions, through: :attraction_categories

  has_many :user_attractions
  has_many :users, through: :user_attractions
  validates :name, presence: true, uniqueness: true

  def public_attractions
    self.attractions.uniq.select{|a| a.public = true}
  end

  def private_attractions
    self.attractions.uniq.select{|a| a.public = false}
  end


end
