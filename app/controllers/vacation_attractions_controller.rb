class VacationAttractionsController < ApplicationController

  def new
    @vacation = Vacation.find_by_id(params[:vacation_id])
    @attractions = Attraction.all
    @vacation_attraction = @vacation.vacation_attractions.build(vacation_id: @vacation.id)
  end

  def create
    @vacation = Vacation.find_by_id(params[:vacation_id])
    @attraction = Attraction.find_by_id(params[:vacation_attraction][:attraction_id])
    @vacation_attraction = VacationAttraction.new(vacation_id: @vacaiton.id, attraction_id: @attraction.id)

    if @vacation_attraction.save
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @vacation_attraction.errors.full_messages
      render :new
    end
  end

    private

    def vacation_attraction_params
      params.require(:vacation_attraction).permit(:attraction_id)
    end



end
