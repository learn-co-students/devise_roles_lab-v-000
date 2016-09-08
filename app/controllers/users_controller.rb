class UsersController < ApplicationController

  def show
    # binding.pry
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = "Access denied."
      return redirect_to '/' 
    end
  end

  def index
    @user ||= current_user
  end

  def destroy
    if current_user.admin?
      User.find(params[:id]).destroy
    end
    redirect_to '/'
  end
end
