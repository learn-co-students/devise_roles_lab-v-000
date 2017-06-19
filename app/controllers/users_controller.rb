class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    @user.destroy
    redirect_to root_url
  end
end
