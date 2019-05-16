class VacationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @user = current_user
    @vacations = @user.vacations
  end

  def new
    @user = current_user
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = @item.build_vacation(name: @item.title)
    @attractions = Attraction.all

  end

  def create
    @user = current_user
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = Vacation.new(vacation_params)
    @vacation.name = @item.title#better: pass in as hidden value from form
    @vacation.bucket_list_items << @item



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

    binding.pry
  end



  private
    def vacation_params
      params.require(:vacation).permit(:name, :category, :budget, :number_of_travelers, :bucket_list_item_id)
    end


end
