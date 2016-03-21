class UsersController < ApplicationController
  #before_action :authenticate_user! 

  def index
  	
  	@user = current_user
  end

  def show
  	@user = User.find_by(id: params[:id])
  	unless @user == current_user ||@user.admin?
  	  redirect_to root_path ,flash[:alert]= "Access denied."
  	end
  end

end
