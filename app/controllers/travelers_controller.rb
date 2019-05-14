class TravelersController < ApplicationController
  before_action :set_traveler, only: [:show, :edit, :update, :destroy]

  def index
    @travelers = Traveler.all
  end

  def new
    @traveler = Traveler.new
  end

  def create
    @traveler = Traveler.new
    @traveler.update(traveler_params)
    if @traveler.save
      redirect_to traveler_path(@traveler)
    else
      flash[:alert] = @traveler.errors.full_messages
      render :new
    end
  end

  def show
    @traveler = Traveler.find_by_id(params[:id])
  end

  def edit
    @traveler = Traveler.find_by_id(params[:id])
  end

  def update
    @traveler = Traveler.find_by_id(params[:id])
    @traveler.update(traveler_params)
    if @traveler.valid?
      redirect_to traveler_path(@traveler)
    else
      render :edit
    end
  end

  def destroy
    @traveler.destroy
  end


  private
    def traveler_params
      params.require(:traveler).permit(:name, :email, :age, :organizer)
    end

    def set_traveler
      @traveler = Traveler.find_by_id(params[:id])
    end


end
