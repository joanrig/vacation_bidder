class Schedule < ApplicationRecord
  belongs_to :vacation

  validates :departure_city, presence: true
  validates :departure_date, presence: true, {before_or_equal_to: Time.zone.now}
  validates :return_city, presence: true
  validates :return_date, presence: true, { after_or_equal_to:  :departure_date}
  validates :vacation_id, presence: true




 end
