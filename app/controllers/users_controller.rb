class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user.try(:admin?) || @user == current_user
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

end
