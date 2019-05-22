class AttractionsController < ApplicationController
  before_action :set_attraction
  before_action :all_categories, only: [:index, :new, :create, :edit]

  def index
  end


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

    UserAttraction.create(user_id: current_user.id, attraction_id: @attraction.id)

    if @attraction.save
      flash[:success] = "Successfully created attraction."
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages
      render :new
    end
  end

  def show
    @categories = @attraction.categories
    ua = UserAttraction.find_by(user_id:current_user.id, attraction_id:@attraction.id)
    ua ? @user_attraction = ua : @user_attraction = UserAttraction.new
  end

  def edit
    @categories = @attraction.categories
    @attraction_category = AttractionCategory.new(attraction_id: @attraction_id)
  end

  def update
    if params[:attraction][:category]
      @category = Category.find_by_id(params[:attraction][:attraction_category][:category_id])
    end

    if @category
      @attraction_category = AttractionCategory.create(attraction_id: @attraction.id, category_id: @category.id)
    end

    if params[:attraction][:user_attraction]
      if UserAttraction.find_by(user_id: current_user.id, attraction_id: @attraction.id)
        flash[:notice] = "You already have this attraction in your collection"
      else
        UserAttraction.create(user_id: current_user.id, attraction_id: @attraction.id)
        flash[:success] = "Successfully added attraction to your collection."
      end
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
      params.require(:attraction).permit(:name, :category_ids, :city, :state, :country, :website, :notes, attraction_category_attributes: [:attraction_id, :category_id], user_attraction_attributes: [:user_id, :attraction_id, :notes])
    end

    def set_attraction
      @attraction = Attraction.find_by_id(params[:id])
    end

    def all_categories
      @all_categories = Category.all
    end

end
