class UsersController < ApplicationController
	before_action :set_user!, except: [:create, :index, :new]
	load_and_authorize_resource :except => [:index, :show]

	def destroy
		@user.destroy
		redirect_to '/'
	end

	def index
		@users = User.all
	end

	def show
		unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
	end

	private

	def set_user!
    @user = User.find(params[:id])
  end

end
