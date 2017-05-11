class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, alert: "Access denied."
      end
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
    else
      return head(:forbidden)
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
