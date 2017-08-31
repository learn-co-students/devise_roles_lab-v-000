class UsersController < ApplicationController
	load_and_authorize_resource except: [:index]

	def index
		@users = User.all
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to '/'
	end

	def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
	end

end