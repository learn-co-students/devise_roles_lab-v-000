class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user!, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy

  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:email])
    @user.update(password: params[:password])

    redirect_to user_path(id: @user.id)
  end

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

	def update(user_params)
		return head(:forbidden) unless current_user.admin?
		@user.update(user_params)
	end

	def destroy
		return head(:forbidden) unless current_user.admin?
		@user = User.find_by(id: params[:id])
		@user.destroy
		redirect_to root_path
	end

	private

  def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

  def set_user!
    @user = User.find(params[:id])
  end

end