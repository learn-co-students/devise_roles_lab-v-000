class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    current_user.delete
    redirect_to root_path
  end

end
