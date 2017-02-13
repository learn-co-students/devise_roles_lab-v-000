class UsersController < ApplicationController

  def new

  end

  def destroy
    @user = User.find_by(params[:id])

    return head(:forbidden) unless @user.user? || @user.admin?
    # binding.pry
    @user = User.find_by(params[:id]).destroy

  end


  private

  def user_params
    params.require(:user).permit(:name)
  end
  

end
