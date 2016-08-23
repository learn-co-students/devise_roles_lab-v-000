class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  before_action :admin_only, only: [:destroy]

  def index
    @users = User.all
    #@user = current_user
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:error] = "Access denied."
      redirect_to root_path 
    end
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path, notice: "User has been deleted."
  end

  private

    def admin_only
      unless current_user.admin? || current_user == @user
        redirect_to users_path, alert: "Access denied."
      end
    end

end
