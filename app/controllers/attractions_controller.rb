class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all.sort_by(&:category)
    @parks = Attraction.where(category:"park")
    @running = Attraction.where(category:"running")
    @hiking = Attraction.where(category:"hiking")
  end
end
