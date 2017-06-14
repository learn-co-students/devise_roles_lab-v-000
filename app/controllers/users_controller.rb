class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

    unless current_user.admin? || current_user == @user
      flash[:notice] = "Access denied."
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])

    return head(:forbidden) unless current_user.admin?

    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])

    return head(:forbidden) unless current_user.admin?

    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

end
