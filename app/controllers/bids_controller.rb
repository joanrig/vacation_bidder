class BidsController < ApplicationController

  def new
    @bidder = Bidder.find_by_id(params[:bidder_id])
    @bid = Bid.new
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
