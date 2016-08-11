class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def show
    if @user != current_user 
      redirect_to root_path, alert: "Access denied."
    end
  end

  def destroy
    if !current_user.admin?
      redirect_to root_path, alert: "You are not authorized to delete users."
    else 
      @user.delete
      redirect_to root_path
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
