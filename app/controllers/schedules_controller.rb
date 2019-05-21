class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vacation, except: [:new, :destroy]


    private
    def schedule_params
      params.require(:schedule).permit(:departure_city, :departure_date, :return_city, :return_date, :vacation_id)
    end

    def set_vacation
      @vacation = Vacation.find_by_id(params[:vacation_id])
    end



end
