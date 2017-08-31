class UsersController < ApplicationController

  before_action :show_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      redirect_to new_user_registration_path
    end
  end


  def index
    @users = User.all
  end

  def show
    if current_user != @user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def edit
    # if current_user != @user
    #   redirect_to root_path, alert: "Access denied."
    # end
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to users_path, alert: "User deleted."
  end

  private

    def admin_only
      unless current_user == @user || current_user.admin?
        redirect_to user_path(id: @user.id), :alert => "Access denied."
      end
    end

    def user_params
      params.required(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def show_user
      @user = User.find_by(id: params[:id])
    end
end
