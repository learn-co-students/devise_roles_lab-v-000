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



  def destroy
    user = User.find(params[:id])
    if current_user.try(:admin?)
      user.destroy
      redirect_to root_url
    else
      render 'index'
    end
    # @user = User.find(params[:id])
    # @user.destroy
    # if @user.destroy
    #   redirect_to root_url, notice: "User deleted."
    # end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end
end
