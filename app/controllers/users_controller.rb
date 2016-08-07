class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @user = current_user
  end

  def new
  end

  def create
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    current_user.delete
    redirect_to user_path
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end