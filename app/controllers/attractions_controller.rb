class AttractionsController < ApplicationController
  before_action :set_attraction
  before_action :all_categories, only: [:index, :new, :create, :edit]

  def index
  @categories = Category.all
  respond_to do |format|
    format.html { render :index }
    format.json { render json: @categories }
  end


  def search
    @attractions = Attraction.where("name LIKE ?", "%#{params[:attraction]}%")
    #binding.pry
    if @attractions
      render :search_results
    else
      flash[:alert] = "Sorry, couldn't find anything by that name, please try again"
      render :index
    end
  end

  def new
    @category = Category.find_by_id(params[:format])
    @attraction = Attraction.new
    @attraction_category = AttractionCategory.new
    @user_attraction = UserAttraction.new
  end

  def create
    @category = Category.find_by_id(params[:attraction][:attraction_category][:category_id])
    if Attraction.find_by(name: attraction_params[:name])
      flash[:alert] = @attraction.errors.full_messages
    else
      @attraction = Attraction.new(name: attraction_params[:name])
      @attraction.created_by = current_user.id
      @attraction_category = AttractionCategory.create(category_id: @category.id, attraction_id: @attraction.id)
    end

    binding.pry

    if @attraction.save
      @user_attraction = UserAttraction.create(user_id: current_user.id, attraction_id: @attraction.id, notes: params[:attraction][:user_attraction][:notes])

      if params[:attraction][:attraction_category]
        @attraction_category = AttractionCategory.create(attraction_id: @attraction.id, category_id: params[:attraction][:attraction_category][:category_id][01])
      end

      flash[:success] = "Successfully created attraction."
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages
      render :new
    end
  end

  def show
    @categories = @attraction.categories.uniq
    if UserAttraction.find_by(user_id:current_user.id, attraction_id:@attraction.id)
      @user_attraction = UserAttraction.find_by(user_id:current_user.id, attraction_id:@attraction.id)
    else
      @user_attraction = UserAttraction.new
    end

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @attraction}
    end
  end

  def edit
    @categories = @attraction.categories
    @attraction_category = AttractionCategory.new(attraction_id: @attraction_id)
    @user_attraction = UserAttraction.find_by(attraction_id:@attraction.id, user_id:current_user.id)
  end

  def update
    binding.pry
    if params[:attraction][:category]
      @category = Category.find_by_id(params[:attraction][:attraction_category][:category_id])
    end

    if @category
      @attraction_category = AttractionCategory.create(attraction_id: @attraction.id, category_id: @category.id)
      #binding.pry
    end

    if params[:attraction][:user_attraction]
      ua = UserAttraction.find_by(user_id: current_user.id, attraction_id: @attraction.id)
      if ua
        @user_attraction = ua
      else
        @user_attraction = UserAttraction.create(user_id: current_user.id, attraction_id: @attraction.id)
        flash[:success] = "Successfully added attraction to your collection."
      end

      if params[:attraction][:user_attraction][:notes] && @user_attraction.update(notes: params[:attraction][:user_attraction][:notes])
        flash[:success] = "Successfully added private notes to this attraction."
      else
        flash[:alert] = @user_attraction.errors.full_messages
      end
    end


    if @attraction.update(attraction_params)
      flash[:alert] = "Successfully updated attraction."

      respond_to do |format|
        format.html { render :show }
        format.json { render json: @attraction, status: 201}
      end
    else
      flash[:alert] = @attraction.errors.full_message
      render :edit
    end
  end

  def destroy
    #remove from my collection; it will remain in public attractions
    @user_attraction = UserAttraction.find_by(user_id: current_user.id, attraction_id:@attraction.id)
    @user_attraction.destroy
    redirect_to categories_path
  end



  private

    def attraction_params
      params.require(:attraction).permit(:name, :category_ids, :city, :state, :country, :website, :notes, :public, :created_by, attraction_category_attributes: [:attraction_id, :category_id], user_attraction_attributes: [:user_id, :attraction_id, :notes])
    end

    def set_attraction
      @attraction = Attraction.find_by_id(params[:id])
    end

    def all_categories
      @all_categories = Category.all
    end

end
