class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vacation, except: [:new, :destroy]


  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedule_path(@schedule)
    else
      render :new
    end

  def show
    @schedule = @vacation.schedule
  end

  def edit
    @schedule = @vacation.schedule
  end

  def update
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

    def set_vacation
      @vacation = Vacation.find_by_id(params[:vacation_id])
    end



end
