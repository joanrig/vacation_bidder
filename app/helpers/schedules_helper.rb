module SchedulesHelper

  def days
    @days = (@schedule.return_date.to_date - @schedule.departure_date).to_i
  end



end
