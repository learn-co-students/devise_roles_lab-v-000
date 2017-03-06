class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def destroy
	u = User.find_by(id: params[:id])
	# Problem here is that we should check
	# for current user instead of the user
	# we're changing.
  	if current_user.role == "admin" || u.role == "vip"
  		u.delete
  	end
    redirect_to root_path
  end

end
