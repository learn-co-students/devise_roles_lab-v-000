class UsersController < ApplicationController


  def index
  end

  def delete
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      redirect_to root_path, alert: "Access denied."
    end
  end


  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
    end
      redirect_to posts_path
  end
end
