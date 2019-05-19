class Schedule < ApplicationRecord
  belongs_to :vacation

  validates :departure_city, presence: true
  validates :departure_date, presence: true
  validates :return_city, presence: true
  validates :return_date, presence: true
  validates :vacation_id, presence: true
  # validate :return_date
  #
  # def return_date
  #   if return_date.before? departure_date
  #     errors.add(:expiration_date, "must be after departure date")
  #   end
  # end

end
