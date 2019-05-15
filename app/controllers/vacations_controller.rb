class VacationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @vacations = current_user.vacations
  end

end
