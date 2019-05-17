#old: class VacationAttractionsController < ApplicationController

class BucketVacationsController < ApplicationController

  def new # build bucket vacations from bucket list items
    @user = current_user
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @bucket_vacation = @item.bucket_vacations.build(bucket_list_item_id: @item.id)
    @vacation = Vacation.new(name: @item.name)
  end

  def create
    binding.pry
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    # @vacation = Vacation.find_by_id(params[:bucket_vacation][:vacation_id])
    @bucket_vacation = BucketVacation.new(bucket_list_item_id: @item.id, vacation_id: @vacation.id, )

    if @bucket_vacation.save
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @bucket_vacation.errors.full_messages
      render :new
    end
  end

    private

    def bucket_vacation_params
      params.require(:bucket_vacation).permit(:vacation_id, :bucket_list_item_id)
    end



end
