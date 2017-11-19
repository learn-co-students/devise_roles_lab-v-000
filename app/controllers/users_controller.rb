class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:index]
  before_action :ensure_user_owner, only: [:show]
  before_action :ensure_admin, only: [:update, :destroy]

  def index
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def find_user
      @user = User.find(params[:id])
    end

    def ensure_user_owner
      unless @user == current_user || current_user.vip? || current_user.admin?
        redirect_to root_path, alert: "Access denied."
      end
    end

end
