class UsersController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_user, only: [:show, :destroy]
  before_action :require_admin, only: :destroy

  def index
  end

  def show

    if @user.id != current_user.id 
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end


  def destroy

    if @user.destroy
      flash[:success] = 'user was destroyed!'
      redirect_to root_path
    else
      flash[:warning] = 'Cannot destroy this user...'
      redirect_to root_path
    end

  end


  private

  def require_admin
    redirect_to root_path unless current_user.role == "admin"
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
