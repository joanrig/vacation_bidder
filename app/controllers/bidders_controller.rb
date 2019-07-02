class BiddersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bidder


  def new
    @bidder = Bidder.new
  end

  def create
    @bidder = Bidder.new(bidder_params)
    current_user.update(role: "bidder")
    if @bidder.save
        render json: @bidder, status: 201
    else
      flash[:alert] = @bidder.full_messages
      render :new
    end
  end

  def show
    @bidder = Bidder.find_by_id(params[:id])
  end


  def edit
    @bidder = Bidder.find_by_id(params[:id])
  end

  def update
    @bidder = Bidder.find_by_id(params[:id])
    @bidder.update(bidder_params)
    if @bidder.save
      flash[:notice] = "Successfully updated."
      redirect_to bidder_path(@bidder)
    else
      flash[:alert] = @bidder.errors.full_messages
      render :edit
    end
  end

  def destroy
    @bidder = Bidder.find_by_id(params[:id])
    @bidder.destroy
  end

  private
    def bidder_params
      params.require(:bidder).permit(:name, :email, :website)
    end

    def set_bidder
      @bidder = Bidder.find_by_id(params[:id]) ||= Bidder.new
    end
end
