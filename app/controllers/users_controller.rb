class UsersController < ApplicationController

  def create
  end

  def update
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip? ||  current_user.try(:id) == @user.id
    @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to '/'
  end

  private

    def user_params
      params.require[:user].permit[:email]
    end
end
