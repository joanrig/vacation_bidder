class SessionsController < ApplicationController

  def new#render login form
    @traveler = Traveler.new
  end

  def create#create new session, ie log in user.
    #binding.pry
    @traveler = Traveler.find_by(name: params[:user][:name])

    if @traveler.try(:authenticate, params[:traveler][:password])
      session[:user_id] = @traveler.id
      flash[:notice]
      redirect_to travelers_path(@traveler)
    else
      render :new
    end

  end

  def destroy
    session.destroy
    redirect_to '/'
  end


end
