class UserAttractionsController < ApplicationController

  def destroy
    @attraction = Attraction.find_by_id(params[:attraction_id])
    @user_attraction = UserAttraction.where(attraction_id:@attraction.id).select{|ua| ua.users.include?(current_user)}
    binding.pry
    @user_attraction.destroy
    redirect_to categories_path
  end
end
