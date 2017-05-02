class UsersController < ApplicationController

  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
    if !current_user.admin? && current_user != @user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  def destroy
    if current_user.admin? && current_user = @user
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path, :alert => "Access denied."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])

  end


  def user_params
    params.require(:user).permit(:email)
  end

end
