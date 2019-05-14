class SessionsController < ApplicationController

  def new#render login form
    @user = User.new
  end

  def create#create new session, ie log in user.
    #binding.pry
    @user = user.find_by(name: params[:user][:name])

    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice]
      redirect_to users_path(@user)
    else
      render :new
    end

  end

  def destroy
    session.destroy
    redirect_to '/'
  end


end
