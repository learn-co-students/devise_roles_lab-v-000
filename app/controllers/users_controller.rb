class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
       redirect_to root_path, alert: 'Access denied.'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
    else
      return head(:forbidden)
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
