class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def index
    binding.pry
  end
  
  def show
    if !current_user.admin? && current_user != @user
        flash[:alert] = "Access denied."
        redirect_to root_path
    end
  end

  def create
      User.find_or_create_by(user_params(:name))
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    @user.delete
    redirect_to root_path
  end

  def update
    # return head(:forbidden) unless current_user.admin?
    if current_user.admin? || current_user = @user
        @user.update(user_params)
        redirect_to root_path
    else
        flash[:alert] = "Access denied."
        redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end