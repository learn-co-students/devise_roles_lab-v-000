class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy]

  def index
  end

  def show
    if current_user.id != params[:id].to_i
      redirect_to root_path, notice: "Access denied."
    else
      render 'show'
    end
  end

  def destroy
    if current_user.admin?
      User.find(params[:id]).destroy
    end
    redirect_to root_path
  end
end
