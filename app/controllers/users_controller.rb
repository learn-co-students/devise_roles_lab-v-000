class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:create, :index, :new]

  def index
    @users = User.all
  end

  def show
    return head(:forbidden) unless current_user == @user
  end

  def update
    return head(:forbidden) unless current_user.admin?
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    current_user.destroy
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find_by(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
