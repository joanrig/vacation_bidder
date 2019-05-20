class Schedule < ApplicationRecord
  belongs_to :vacation
  validates :vacation_id, presence: true
  validates :departure_city, presence: true
  validates :return_city, presence: true

  validates :departure_date, presence: true
  validates :return_date, presence: true
  validate :return_date_after_departure_date?
  validate :departure_date_must_be_in_future
  validate :departure_date_must_be_in_future


  def return_date_after_departure_date?
    if departure_date && return_date
      if return_date <= departure_date
      errors.add :return_date, "must be after departure date"
      end
    end
  end

  def departure_date_must_be_in_future
    if departure_date <= Date.today
      errors.add :departure_date, "must be in future"
    end
  end

  def departure_date_must_be_in_future
    if return_date <= Date.today
      errors.add :return_date, "must be in future"
    end
  end


 end
