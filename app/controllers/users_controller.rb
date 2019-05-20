class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:alert] = "Successfully updated user"
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
  end

  private



end
