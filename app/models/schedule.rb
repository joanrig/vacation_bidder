class Schedule < ApplicationRecord
  belongs_to :vacation
  validates :vacation_id, presence: true

  validate :return_date_after_departure_date?
  validate :departure_date_must_be_in_future
  validate :return_date_must_be_in_future
  validate :must_include_both_dates
  #validate :must_include_both_cities


  def return_date_after_departure_date?
    if departure_date && return_date
      if return_date <= departure_date
      errors.add :return_date, "Return date must be after departure date."
      end
    end
  end

  def departure_date_must_be_in_future
    if departure_date && departure_date <= Date.today
      errors.add :departure_date, "must be in future."
    end
  end

  def return_date_must_be_in_future
    if return_date && return_date <= Date.today
      errors.add :return_date, "must be in future."
    end
  end

  def must_include_both_dates
    if departure_date && !return_date
      errors.add :return_date, "is missing"
    elsif return_date && !departure_date
      errors.add :departure_date, "is missing."
    end
  end


  # def must_include_both_cities
  #   binding.pry
  #   if departure_city && (return_city ==  nil || "")
  #     errors.add :return_city, "is missing."
  #   elsif return_city && (departure_city == nil || "")
  #     errors.add :departure_city, "is missing"
  #   end
  # end


 end
