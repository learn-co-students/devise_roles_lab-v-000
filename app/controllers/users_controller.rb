class UsersController < ApplicationController

  def index

  end

  def show
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      redirect_to users_path, :alert => "Access denied."
    end
  end


  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to users_path
  end

private

def user_params
  params.require(:user).permit(:email, :name, :role)
end


end
