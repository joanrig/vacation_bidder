class BucketAttractionsController < ApplicationController


  def new
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @attractions = Attraction.all
    @bucket_attraction = @item.bucket_attractions.build(bucket_list_item_id: @item.id)
  end

  def create
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @attraction = Attraction.find_by_id(params[:bucket_attraction][:attraction_id])
    @bucket_attraction = BucketAttraction.new(bucket_list_item_id: @item.id, attraction_id: @attraction.id)

    if @bucket_attraction.save
      redirect_to bucket_list_item_path(@item)
    else
      flash[:alert] = @bucket_attraction.errors.full_messages
      render :new
    end
  end

    private

    def bucket_attraction_params
      params.require(:bucket_attraction).permit(:attraction_id)
    end



end
