class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user!, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy

   

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end


  def destroy
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

  def set_user!
    @user = User.find(params[:id])
  end

end