class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      redirect_to 'index'
    else
      flash[:notice] = "Access denied."
      render 'show'
    end 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if current_user.try(:admin?) || user == current_user
      user.update(user_params)
      redirect_to root_url
    else
      render 'index'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.role = 'admin'
    if current_user.try(:admin?) || current_user.id == user.id
      user.delete
      redirect_to root_url
    else
      render 'index'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end
end
