class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    return redirect_to root_path unless current_user.admin?
  end

  def create
    return redirect_to root_path unless current_user.admin?
  end

  def new
    return redirect_to root_path unless current_user.admin?
  end

  def edit
    return redirect_to root_path unless current_user.admin?
  end

  def show
    return redirect_to root_path unless current_user.admin?
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
