class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
    @public =  Attraction.where(public:true).select{|a| a.categories.include?(@category)}
    @private =  Attraction.select{|a| a.categories.include?(@category) && a.users.include?(current_user)}
    @both = @public + @private

    if current_user
      @category_attractions = @private
    else
      @category_attractions = @public
    end

  end

end
