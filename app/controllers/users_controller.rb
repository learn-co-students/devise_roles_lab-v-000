class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      redirect_to root_path, alert: "Access denied."
    end
  end


end
