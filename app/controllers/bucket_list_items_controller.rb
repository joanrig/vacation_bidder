class BucketListItemsController < ApplicationController

  def index
    @traveler = current_user
    @items = @traveler.bucket_list_items.all
  end

  def new
    @item = BucketListItem.new
  end

  def create
    @item = BucketListItem.new
    @item.update(item_params)
    if @item.save
      redirect_to bucket_list_item_path(@item)
    else
      flash[:alert] = @item.errors.full_messages
      render :new
    end
  end

  def show
    @item = BucketListItem.find_by_id(params[:id])
  end

  def edit
  end

  def update
    @item = BucketListItem.find_by_id(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to bucket_list_item_path(@item)
    else
      flash[:alert] = @item.errors.full_messages
      render :edit
    end

  end




    private
      def item_params
        params.require(:bucket_list_item).permit(:title, :traveler_id, :vacation_id, :notes)
      end

end
