class AttractionsController < ApplicationController


  def new
    @attraction = Attraction.new
  end


  def show
    #binding.pry
    @attraction = Attraction.find_by_id(params[:id])
  end

  def edit
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    if @attraction.valid?
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end


  private

    def attraction_params
      params.require(:attraction).permit(:name, :category_ids, :website, :notes)
    end

end
