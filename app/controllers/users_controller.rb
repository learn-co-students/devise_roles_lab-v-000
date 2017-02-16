class UsersController < ApplicationController
  before_action :check_admin, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def show
    if current_user && params[:id] != current_user.id
      redirect_to root_path, notice: "Access denied."
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def check_admin
    if current_user.try(:user?) || current_user.try(:vip?)
      redirect_to root_path
    end
  end
end
