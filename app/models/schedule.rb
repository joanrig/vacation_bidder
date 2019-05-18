class Schedule < ApplicationRecord
  belongs_to :vacation 
  validates :departure_city, presence: true
  validates :departure_date, presence: true
  validates :return_city, presence: true
  validates :return_date, presence: true
  validates :vacation_id, presence: true
end
