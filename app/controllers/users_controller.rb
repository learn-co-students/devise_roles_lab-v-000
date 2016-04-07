class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
      @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def show
    @user = User.find(params[:id])
   unless current_user.admin?
     unless @user == current_user
       redirect_to :back, :alert => "Access denied."
     end
   end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
   unless current_user.admin?
     redirect_to :back, :alert => "Access denied."
   end
 end

  def secure_params
    params.require(:user).permit(:role)
  end
end
