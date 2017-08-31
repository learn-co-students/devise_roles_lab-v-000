class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :admin_only, only: [:destroy]
  before_action :find_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def show
    redirect_to :back, :alert => "Access denied." unless current_user.admin? || @user == current_user
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end


  private

    def user_params
      params.require(:user).permit(:role)
    end

    def admin_only
      redirect_to users_path unless current_user.admin?
    end

    def find_user
      @user = User.find(params[:id])
    end
end
