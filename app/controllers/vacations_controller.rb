class VacationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @user = current_user
    @vacations = @user.vacations
  end

  def new
    @user = current_user

    unless @user.bucket_list_items.empty?
      @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
      @vacation = @item.build_vacation(name: @item.name)
      @attractions = Attraction.all
    else
      flash[:alert] = "We need a bucket list item to build a vacation. Let's add to your bucket list!"
      redirect_to new_bucket_list_item_path
    end

  end

  def create
    @user = current_user
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = Vacation.new(vacation_params)
    @vacation.name = @item.name#better: pass in as hidden value from form

    if @vacation.save
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @vacation.errors.full_messages
      render :new
    end
  end


  def show
    @vacation = Vacation.find_by_id(params[:id])
    @user = current_user
  end

  def edit
    @vacation = Vacation.find_by_id(params[:id])
    @user = current_user
    @attractions = @vacation.attractions
    @all_attractions = Attraction.all
    @vacation_attraction = VacationAttraction.new(vacation_id: @vacation.id)

  end

  def update
    @vacation = Vacation.find_by_id(params[:id])
    @user = current_user
    @vacation.update(vacation_params)

    if params[:vacation][:vacation_attraction][:attraction_id]
      VacationAttraction.create(vacation_id: @vacation.id, attraction_id: params[:vacation][:vacation_attraction][:attraction_id])
    end

    if @vacation.save
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @vacation.errors.full_messages
      render :new
    end
  end



  private
    def vacation_params
      params.require(:vacation).permit(:name, :category, :budget, :number_of_travelers, :bucket_list_item_id, :open_to_bids, attraction_ids: [])
    end


end
