class VacationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @user = current_user
    @vacations = @user.vacations
  end

  def new
    @user = current_user
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = Vacation.new
  end

  def create
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = Vacation.new(vacation_params)
    @vacation.bucket_list_items << @item
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
    binding.pry
    @vacation = Vacation.find_by_id(params[:id])
    @user = current_user
    @vacation.update(vacation_params)

    if params[:vacation][:vacation_attraction][:attraction_id]
      VacationAttraction.create(vacation_id: @vacation.id, attraction_id: params[:vacation][:vacation_attraction][:attraction_id])
    end

    if @vacation.save
      #@user.vacations << @vacation
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @vacation.errors.full_messages
      render :new
    end
  end

  def destroy
    @vacation = Vacation.find_by_id(params[:id])
    @vacation.destroy
    redirect_to vacations_path
  end



  private
    def vacation_params
      params.require(:vacation).permit(:name, :category, :budget, :number_of_travelers, :bucket_list_item_id, :open_to_bids, attraction_ids: [])
    end


end
