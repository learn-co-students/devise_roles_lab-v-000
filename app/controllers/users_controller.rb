class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    find_user
  end

  def update
    find_user
    @user.update(user_params)
  end
  
  def show
    find_user
    unless @user == current_user || @user.try(:admin?)
      redirect_to root_path, alert: "Access denied."
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end


end



 