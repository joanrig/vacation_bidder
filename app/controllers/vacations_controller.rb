class VacationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vacation, only: [:show, :edit, :update, :destroy]
  before_action :set_user


  def index
    @vacations = @user.vacations.uniq
     respond_to do |format|
      format.html { render :index }
      format.json { render json: @vacations}
    end
  end

  def new
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = Vacation.new
    @vacation.notes = @item.notes
  end

  def create
<<<<<<< Updated upstream
=======
    #binding.pry
>>>>>>> Stashed changes
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = Vacation.new(vacation_params)
    @vacation.bucket_list_items << @item
    @vacation.name = @item.name#better: pass in as hidden value from form

    if @vacation.save
      flash[:alert] = "Successfully created vacation."
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @vacation.errors.full_messages
      render :new
    end
  end

  def show
    @schedule = @vacation.schedule
    @attractions = @vacation.attractions
  end

  def edit
    @attractions = @vacation.attractions
    @vacation_attraction = VacationAttraction.new(vacation_id: @vacation.id)

    @public =  Attraction.where(public:true)
    @private =  Attraction.select{|a| a.created_by = current_user.id}
    binding.pry
    @both = @public + @private

    # if you want to create attractions from vacations edit page
    # @attraction = Attraction.new
    # @attraction_category = AttractionCategory.new
    # @all_categories = Category.all
    # @category = Category.new


    if @vacation.schedule
      @schedule = @vacation.schedule
    else
      @schedule = Schedule.new
    end
    @attraction = Attraction.new
  end

  def update
    @vacation_attraction = VacationAttraction.new(vacation_id: @vacation.id)
    @vacation.update(vacation_params)
    @all_attractions = Attraction.all

    if params[:vacation][:vacation_attraction][:attraction_id]
      VacationAttraction.create(vacation_id: @vacation.id, attraction_id: params[:vacation][:vacation_attraction][:attraction_id])
      flash[:success] = "Successfully added attraction to itinerary."
    end

    if params[:vacation][:schedule]
      if @vacation.schedule
        @schedule = @vacation.schedule
      else
        @schedule = Schedule.new
      end

  #Schedule.new(params[:vacation][:schedule]) returns forbidden attributes errors
      @schedule.update(
      vacation_id: @vacation.id,
      departure_city: params[:vacation][:schedule][:departure_city].titleize,
      departure_date: params[:vacation][:schedule][:departure_date],
      return_city: params[:vacation][:schedule][:return_city].titleize,
      return_date: params[:vacation][:schedule][:return_date])
      if @schedule.valid?
        flash[:alert] = "Successfully created schedule"
      else
        flash[:alert] = @schedule.errors.full_messages
        render :edit and return #need 'and return' to avoid double render error
      end
    end

    p = params[:vacation][:vacation_attraction]
    if p
      @attraction = Attraction.new(name: p)
    end

    if @vacation.save
      flash[:alert] = "Successfully updated vacation"
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @vacation.errors.full_messages
      render :edit
    end
    #binding.pry
  end

  def destroy
    @vacation.destroy
    redirect_to vacations_path
  end


  private
    def vacation_params
      params.require(:vacation).permit(:name, :category, :budget, :number_of_travelers, :bucket_list_item_id, :open_to_bids, :notes, attraction_ids: [], schedule_attributes: [:departure_city, :departure_date, :return_city, :return_date, :notes, :vacation_id])
    end

    def set_vacation
      @vacation = Vacation.find_by_id(params[:id])
    end

    def set_user
      @user = current_user
    end


end
