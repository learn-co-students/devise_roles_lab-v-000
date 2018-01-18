class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def create

  end

  def new

  end

  def edit
    return redirect_to root_path unless current_user.admin?
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user == current_user
      :show
    else
      flash[:error]= "Access denied."
      redirect_to root_path
    end
  end

  def update
    return redirect_to root_path unless current_user.admin?
  end

  def destroy
    return redirect_to root_path unless current_user.admin?
    User.find_by(id: params[:id]).delete
    redirect_to root_path
  end
end
