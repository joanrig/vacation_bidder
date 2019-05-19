class AttractionsController < ApplicationController


  def new
    @category = Category.find_by_id(params[:category_id])
    @attraction = Attraction.new
  end

  def create
    binding.pry
    @category = Category.find_by_id(params[:category_id])
    @attraction = Attraction.new(attraction_params)
    @category.attractions << @attraction
    @categories = Category.all
    @category_attraction = CategoryAttraction.new
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages
      render :new
    end
  end

  def show
    #binding.pry
    @attraction = Attraction.find_by_id(params[:id])
    @categories = @attraction.categories
    @all_categories = Categories.all
  end

  def edit
    binding.pry
    @attraction = Attraction.find_by_id(params[:id])
    @categories = Attraction.find_by_id(params[:id]).categories
    @category_attraction = CategoryAttraction.new(attraction_id: @atraction_id)
  end

  def update
    @category = Category.find_by_id(params[:id])
    @category_attraction =
    CategoryAttraction.create(category_id: @category.id)

    if params[:category][:category_attraction]
      CategoryAttraction.create(attraction_id: params[:category][:category_attraction][:attraction_id])
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
      params.require(:attraction).permit(:name, :category_ids, :website, :notes)
    end

end
