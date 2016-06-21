class UsersController < ApplicationController
  before_action :set_user

  def index
    # binding.pry
    @user = User.first
  end

  def show
    @user
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Successfully deleted user.'
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
