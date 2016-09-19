class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_user, except: [:create, :index, :new]

  def index
    @users = User.all
  end

  def show
    if current_user.id != @user.id
      redirect_to root_path, :flash => { :error => "Access denied." }
    end
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
