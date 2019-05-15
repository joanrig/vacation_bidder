class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    #binding.pry
    @attraction = Attraction.find_by_id(params[:id])
  end

end
