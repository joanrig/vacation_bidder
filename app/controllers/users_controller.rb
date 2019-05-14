class usersController < ApplicationController
  before_action :verify_login, :current_user, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = user.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = user.find_by_id(params[:id])
  end

  def edit
    @user = user.find_by_id(params[:id])
  end

  def update
    @user = user.find_by_id(params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :age, :organizer)
    end

    def set_user
      @user = user.find_by_id(params[:id])
    end


end
