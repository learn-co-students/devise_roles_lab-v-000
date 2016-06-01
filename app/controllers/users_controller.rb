class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Something didn't work. Please try again."
      redirect_to :back
    end
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    current_user.destroy

    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, alert: 'Access denied.'
      end
    end
  end

  private
    def user_params
      params.require(:post).permit(:email, :name)
    end
end
