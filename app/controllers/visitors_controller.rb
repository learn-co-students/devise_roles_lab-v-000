class VisitorsController < ApplicationController
  def index
    redirect_to user_path(current_user) if signed_in?  
  end
end
