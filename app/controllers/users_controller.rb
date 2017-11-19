class UsersController < ApplicationController

  def index

  end

  def destroy
    @user = User.find(params[:id])
    if !current_user.admin? || current_user.vip?
      flash[:alert] = "Access denied."
      redirect_to root_path
    else
      @user.destroy
      redirect_to root_path
    end
  end

  def show
    if current_user.id.to_s != params[:id]
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

end
