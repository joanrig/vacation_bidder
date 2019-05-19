class AttractionsController < ApplicationController



  def new
    @category = Category.find_by_id(params[:format])
    @attraction = Attraction.new
  end

  def create
    binding.pry
    @category = Category.find_by_id(params[:category_id])
    @attraction = Attraction.new(attraction_params)
    @categories = Category.all

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages
      render :new
    end
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @categories = @attraction.categories
  end

  def edit
    #binding.pry
    @attraction = Attraction.find_by_id(params[:id])
    @categories = Attraction.find_by_id(params[:id]).categories
    @attraction_category = AttractionCategory.new(attraction_id: @atraction_id)
  end

  def update
    binding.pry
    @category = Category.find_by_id(params[:id])
    @attraction_category =
    AttractionCategory.create(category_id: @category.id)

    if params[:category][:attraction_category]
      AttractionCategory.create(attraction_id: params[:category][:attraction_category][:attraction_id])
    end

    if @attraction.update(attraction_params)
      flash[:alert] = "Successfully updated attraction."
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_message
      render :edit
    end
  end

  def destroy
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.destroy
    redirect_to attractions_path
  end



  private

    def attraction_params
      params.require(:attraction).permit(:name, :category_ids, :city, :state, :country, :website, :notes)
    end

end
