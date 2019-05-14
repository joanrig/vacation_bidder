class VacationsController < ApplicationController
  before_action :verify_login, :current_user
end
