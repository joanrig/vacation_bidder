module VacationsHelper

#not being recognized in vacations views
  def days_long
    if @schedule.return_date && @schedule.departure_date
      (@schedule.return_date.to_date - @schedule.departure_date).to_i
    end
  end

  def budget_per_person
    if @vacation.budget && @vacation.number_of_travelers
      @vacation.budget/ @vacation.number_of_travelers
    end
  end

  def budget_per_person_per_day
    if budget_per_person && days_long
      budget_per_person / days_long
    end
  end

end
