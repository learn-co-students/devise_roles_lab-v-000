class UsersController < ApplicationController

  def destroy
    return head(:forbidden) unless current_user.admin?
    user = User.find_by(id: params[:id])
    user.destroy if !user.nil?
    redirect_to users_path
  end

end
