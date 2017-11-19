class UsersController < ApplicationController

  def new

  end

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])

    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end

  end

  def destroy
    @user = User.find_by(params[:id])

    return head(:forbidden) unless current_user.admin? && current_user = @user#@user.admin?
    # binding.pry
    @user = User.find_by(params[:id]).destroy



  end


  private

  def user_params
    params.require(:user).permit(:name)
  end
  

end
