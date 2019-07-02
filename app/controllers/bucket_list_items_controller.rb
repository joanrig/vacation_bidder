class BucketListItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bucket_list_item, except: [:index, :new, :create]
  before_action :set_user, except: [:update, :destroy]

  def index
    @items = helpers.items
    @dreams = helpers.dreams
    @real = helpers.real
    @vacations = helpers.vacations
  end

  def new
    binding.pry
    @item = BucketListItem.new
  end

  def create
    @item = BucketListItem.new
    @item.update(item_params)
    if @item.save
      flash[:alert] = "Successfully created bucket_list_item."
      redirect_to bucket_list_item_path(@item)
    else
      flash[:alert] = @item.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      flash[:alert] = "Successfully updated bucket list item."
      redirect_to bucket_list_item_path(@item)
    else
      flash[:alert] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to bucket_list_items_path
  end


  private
    def item_params
      params.require(:bucket_list_item).permit(:name, :user_id, :vacation_id, :notes, bucket_attraction_attributes: [:attraction_id, :bucket_list_item_id])
    end

    def set_bucket_list_item
      @item = BucketListItem.find_by_id(params[:id])
    end

    def set_user
      @user = current_user
    end


end
