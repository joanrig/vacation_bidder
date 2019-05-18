class SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def create
    @vacation = Vacation.find_by_params(:vacation_id)
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedule_path(@schedule)
    else
      render :new
    end

  def show
    @vacation = Vacation.find_by_id(params[:vacation_id])
    @schedule = @vacation.schedule
  end

  def edit
    @vacation = Vacation.find_by_id(params[:vacation_id])
    @schedule = @vacation.schedule
  end

  def update
    @vacation = Vacation.find_by_id(params[:vacation_id])
    @schedule = @vacation.schedule
    @schedule.update(schedule_params)
    if @schedule.save
      redirect_to schedule_path(@schedule)
    else
      render :new
    end
  end

  def destroy
    @schedule = Schedule.find_by_id(params[:id])
    @schedule.destroy
  end

    private
    def schedule_params
      params.require(:schedule).permit(:departure_city, :departure_date, :return_city, :return_date, :vacation_id)
    end
  

end
