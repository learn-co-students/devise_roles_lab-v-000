class UsersController < ApplicationController
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy if current_user.admin?
    redirect_to '/'
  end
  def index
    @users = User.all
  end

  def show
    
    if current_user.id == params[:id].to_i
        @user = User.find_by_id(params[:id])
    else
      flash[:alert] = 'Access denied.'
      redirect_to '/'
    end
  end


end
