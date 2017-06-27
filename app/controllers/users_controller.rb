class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def show
    #jimmy rigged this crap to pass the test, was getting weird capybara error
    #with return head(:forbidden)
    redirect_to error_path unless current_user.admin? ||
      current_user.try(:id).to_s == params[:id]

  end

  def error

  end
end
