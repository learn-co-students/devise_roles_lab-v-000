class Devise::SessionsController < DeviseController

	def new
		self.resource = User.new
	end

	def create
		@user = User.find_by(:email => params[:user][:email])
		if @user && @user.valid_password?(params[:user][:password])
	 		session[:user_id] = @user.id
		    flash[:notice] = "Signed in successfully."
		 	redirect_to root_path
		else
		 	flash[:notice] = "Invalid email or password."
		 	redirect_to new_user_session_path
		end
	end


	def destroy
		session.clear
		flash[:notice] = "Signed out successfully."
		redirect_to root_path
	end
end