class UsersController < ApplicationController

  def destroy
    @user = User.find_by(id: params[:id])
    if current_user.admin?
      @user.destroy
    end
    redirect_to root_path
  end
end
