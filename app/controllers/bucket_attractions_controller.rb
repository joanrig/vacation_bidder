class BucketAttractionsController < ApplicationController


  def new
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @attractions = Attraction.all
    @bucket_attraction = @item.bucket_attractions.build(bucket_list_item_id: @item.id)
  end

  def create
    binding.pry
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @attraction = Attraction.find_by_id(params[:attraction_id])
    @bucket_attraction = BucketAttraction.create(bucket_list_item_id: @item.id, attraction_id: @attraction.id)


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
