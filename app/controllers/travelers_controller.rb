class TravelersController < ApplicationController

  def index
    @travelers = Traveler.all
  end

  def new
    @traveler = Traveler.new
  end
end
