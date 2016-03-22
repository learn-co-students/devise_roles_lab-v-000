class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin? || @user == current_user
      redirect_to root_path, alert: 'Access denied.'
    end
  end

end