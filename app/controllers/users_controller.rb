class UsersController < ApplicationController

  def destroy
    return head(:forbidden) unless current_user.admin?
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end
end
