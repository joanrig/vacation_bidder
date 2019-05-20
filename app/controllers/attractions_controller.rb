class AttractionsController < ApplicationController
  before_action :set_attraction, except: [:new, :create]
  before_action :all_categories, only: [:new, :create, :edit]



  def new
    @category = Category.find_by_id(params[:format])
    @attraction = Attraction.new
    @attraction_category = AttractionCategory.new
  end

  def create
    @category = Category.find_by_id(params[:attraction][:attraction_category][:category_id])
    @attraction = Attraction.create(attraction_params)
    #need to save attraction id so it can be given to attraction_category

    if params[:attraction][:attraction_category][:category_id]
      @attraction_category = AttractionCategory.create(attraction_id: @attraction.id, category_id: params[:attraction][:attraction_category][:category_id])
    end

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages
      render :new
    end
  end

  def show
    @categories = @attraction.categories
  end

  def edit
    #binding.pry
    @categories = @attraction.categories
    @attraction_category = AttractionCategory.new(attraction_id: @attraction_id)
  end

  def update
    @category = Category.find_by_id(params[:attraction][:attraction_category][:category_id])
    if @category
      @attraction_category = AttractionCategory.create(attraction_id: @attraction.id, category_id: @category.id)
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
    @attraction.destroy
    redirect_to categories_path
  end



  private

    def attraction_params
      params.require(:attraction).permit(:name, :category_ids, :city, :state, :country, :website, :notes, attraction_category_attributes: [:attraction_id, :category_id] )
    end

    def set_attraction
      @attraction = Attraction.find_by_id(params[:id])
    end

    def all_categories
      @all_categories = Category.all
    end

end
