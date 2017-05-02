class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create ]
  before_action :set_user, except: [:index, :new, :create ]

  def index
    @users = User.all
  end

  def show
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  def destroy
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    else
      @user = User.find(params[:id])
        @user.destroy
      

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
