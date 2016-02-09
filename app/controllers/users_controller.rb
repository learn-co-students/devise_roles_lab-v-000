class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, :except => :show


  def index
    @users = User.all
  end

  def show
    find_user
    admin_or_current_user?
  end

  def update
    find_user
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), :alert => 'User Information Updated'
    else
      redirect_to user_path(@user), :alert => 'Information Was Not Updated!!'

    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    find_user
    @user.destroy
    redirect_to users_path, :alert => "User Has Been Deleted!!"
  end

  private

    def find_user
      user = User.find(params[:id])
    end

    def admin_or_current_user?
      unless current_user.admin? || @user == current_user
        redirect_to :back, :alert => 'Access denied'
      end
    end

    def is_admin?
      unless current_user.admin?
        redirect_to :back, :alert => 'Access denied.'
      end
    end

    def user_params
      params.require(:user).permit(:role)
    end

end
