class UsersController < ApplicationController
  before_action :set_user, except: [:create, :index, :new]
  before_action :admin_only, only: [:destroy, :show]

  def index
    @users = User.all
  end

  def show

  end

  def destroy
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin? || @user == current_user # is user admin or did user make the post
      redirect_to users_path, :alert => "Access denied." # if no, denied!
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
