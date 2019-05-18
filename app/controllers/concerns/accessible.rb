module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

# checks users and immediately reroutes them to correct path - this fixes glitch that occurs when users with different roles sign into app from same browser.
#https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models
  protected
  def check_user
    if current_bidder
      flash.clear
      redirect_to(authenticated_bidder_root_path) && return
    elsif current_user
      flash.clear
      redirect_to(authenticated_user_root_path) && return
    end
  end
end
