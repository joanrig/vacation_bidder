class BidsController < ApplicationController
  before_action :authenticate_user!


  

  def new
    @bidder = Bidder.find_by_id(params[:bidder_id])
    @bid = Bid.new
    @vacations = Vacation.where("open_to_bids = ?", true)
  end

  def create
    @bidder = Bidder.find_by_id(params[:bidder_id])
    @bid = Bid.new(bidder_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def bid_params
    params.require(:bid).permit(:bidder_id, :vacation_id, :amount, :link)
  end


end
