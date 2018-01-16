class UsersController < ApplicationController

	#before_action :authenticate_user!
	
	def index
		 
	end

	def destroy

		@user = User.find(params[:id])
    	return head(:forbidden) unless current_user.admin? 
            current_user.try(:id) == @user.id
    	@user.destroy

    	redirect_to '/posts'
	
	end

	def show
		unless current_user.admin?
			unless @user == current_user
				redirect_to '/posts', :alert => "Access denied."
			end
		end

	end
	

end
