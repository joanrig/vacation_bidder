class BucketListItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @items = BucketListItem.where("user_id = ?", @user.id)
  end

  def new
    @user = current_user
    @item = BucketListItem.new
  end

  def create
    @user = current_user
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
    @user = current_user
    @item = BucketListItem.find_by_id(params[:id])
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

  def attractions
    @item = BucketListItem.find_by_id(params[:bucket_list_item_id])
    @user = current_user
    @attractions = @item.try(:attractions)
    binding.pry
    render :attractions
  end




  private
    def item_params
      params.require(:bucket_list_item).permit(:title, :user_id, :vacation_id, :notes, :attraction_ids)
    end

end
