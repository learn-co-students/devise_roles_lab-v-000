class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy
  

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied, Admin only."
      end
    end
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password: params[:password])
    redirect_to user_path(id: @user.id)
  end

  def update
    if @user.update_attributes(role_params)
        redirect_to users_path, :notice => "User updated"
    else
      redirect_to users_path, :notice => "User unable to update"
    end
  end



  def destroy
    @user.destroy
    redirect_to users_path, :notice => "User has been deleted."
  end

private
  def role_params
    params.require(:user).permit(:role)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Only admin can do that!"
    end
  end

end