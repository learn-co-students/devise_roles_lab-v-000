class UsersController < ApplicationController
	before_action :set_user, only: [:create, :edit, :update, :destroy]

  def index
  	@users = User.all 
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    @user.save
  end

  def edit
  end

  def update
  	if @user.admin?
  	  @user.update(user_params)
  	  redirect_to @user
  	else
  	  redirect_to users_path
  	end
  end

  def destroy

  	if @user.admin?
  	  @user.destroy
  	  redirect_to users_path
  	else
  	  redirect_to users_path
  	end
  end

  private

  def set_user
  	@user = current_user
  end

  def user_params
  	params.require(:user).permit(:name, :email, :role)
  end




end
