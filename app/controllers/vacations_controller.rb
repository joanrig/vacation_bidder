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
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @vacation = @item.build_vacation(vacation_params)
    binding.pry
    Vacation.new(vacation_params)
    #try shoveling.
  end

  private
    def vacation_params
      params.require(:vacation).permit(:name, :category, :budget, :number_of_travelers, :bucket_list_item_id)
    end


end
