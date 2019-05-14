class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def verify_login
      redirect_to '/users/new' unless logged_in?
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user = user.find_by_id(session[:user_id]) if logged_in?
    end
end
