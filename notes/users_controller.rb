class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
  end

  private



end
