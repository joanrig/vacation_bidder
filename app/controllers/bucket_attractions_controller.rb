class BucketAttractionsController < ApplicationController


  def new
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @attractions = Attraction.all
    @bucket_attraction = @item.bucket_attractions.build(bucket_list_item_id: @item.id)
    #figure out how to call it from another controller
  end

  def create
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @attraction = Attraction.find_by_id(params[:attraction_id])

    @item.bucket_attractions.build(attraction_id: @attraction)
    binding.pry
    if @item.save
      redirect_to bucket_list_item_path(@item)
    else
      flash[:alert] = @item.errors.full_messages
      render :new
    end

    binding.pry
    #grab id from params, grab user id to create this new bucket attraction,
  end


end
