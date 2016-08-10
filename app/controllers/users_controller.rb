class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path, alert: 'Access denied.'
    else
      render :show
    end
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to users_path
  end
end
