class UsersController < ApplicationController
  def show
  	@user=User.find(params[:id])
  	#byebug
  	unless @user==current_user || @user.admin?

  		redirect_to root_path, alert: "Access denied."
  	end
  end

  def index
  	@user = current_user
  end
end
