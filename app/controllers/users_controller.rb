class UsersController < ApplicationController
  def index
  end

  def show
    if current_user.id == params[:id]
      render :show
    else
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    if current_user.role == "admin"
      @user = User.find_by(:id => params[:id])
      User.destroy(@user.id)
    end

    redirect_to root_path
  end
end
