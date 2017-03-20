class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find_by_id(params[:id])
     if !current_user.admin? && current_user != @user
       redirect_to root_path, :notice => "Access denied."
     end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    user = user.find_by_id(params[:id])
    if current_user.admin?
      user.update(user_params)
      redirect_to user_path(user)
    else
      flash_error
      redirect_to user_path(user)
    end
  end

  def destroy
    user = user.find_by_id(params[:id])
    if current_user.admin?
      user.delete
      redirect_to root_path
    else
      flash_error
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
