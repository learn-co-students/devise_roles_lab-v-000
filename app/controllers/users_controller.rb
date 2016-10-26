class UsersController < ApplicationController

  def new
  end 

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password: params[:password])
    redirect_to user_path(id: @user_id)
  end 

  def index
    @users = User.all
  end 

  def show
    unless current_user.admin? || current_user = @user 
      redirect_to '/', :alert => "Access denied."
    end 
  end 
  
  def update
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end 

  def destroy
    @user = User.find_by_id(params[:id]) if current_user
    if current_user.try(:admin?) || current_user == @user 
      @user.destroy
      redirect_to users_path, :notice => "User successfully deleted."
    else 
      redirect_to users_path, :alert => "Sorry, this action is not permitted."
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:role)
  end

end
