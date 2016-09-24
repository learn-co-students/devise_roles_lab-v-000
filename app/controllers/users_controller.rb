class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy!
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
     unless current_user.admin? || current_user.id == @user.id
        redirect_to users_path, alert: "Access denied."
     end
  end


  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.id == @user.id
    @user.update(user_params)
  end


  def user_params
     params.require(:user).permit(:email)
   end
end