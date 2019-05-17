class BiddersController < ApplicationController



  def new
    @bidder = Bidder.new
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  private
    def bidder_params
      params.require(:bidder).permit(:name, :email, :website)
    end
end
