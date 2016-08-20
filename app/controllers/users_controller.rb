class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :find_user, except: [:create, :index, :new]

  def index
    @users = User.all
  end

  def show
    redirect_to users_path, alert: "Access denied." unless current_user == @user
  end

  def update
    return head(:forbidden) unless current_user.admin?
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    if current_user.admin? 
      current_user.destroy
      redirect_to users_path
    else
      redirect_to user_path, notice: "Access denied."
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
