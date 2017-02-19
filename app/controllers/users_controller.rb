class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    if current_user == params[:id]
      @user = User.find(params[:id])
    else
      flash[:alert] = 'Access denied.'
      redirect_to root_path
    end
  end


  def update
    if current_user.admin?
      binding.pry
    end
  end

  def destroy
    if current_user.admin?
      User.find(params[:id]).destroy
    end
    redirect_to '/'
  end
end
