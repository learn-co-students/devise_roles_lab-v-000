class UsersController < ApplicationController
  def destroy
    return head(:forbidden) unless current_user.admin?
    User.find(params[:id]).delete
  end

  def index
    @user = current_user
  end

  def show
    if current_user == User.find_by(id: params[:id])
      @user = current_user
    else
      redirect_to '/', :alert => "Access denied."
    end
  end
end
