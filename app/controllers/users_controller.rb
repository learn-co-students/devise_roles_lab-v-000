class UsersController < ApplicationController




def destroy
	@user = User.find(params[:id])
    if current_user.admin? 
      @user.destroy
      redirect_to @user
    else
      return head(:forbidden) 
    end

end


def index

end

def show
	@user = User.find(params[:id])

	if current_user.id != @user.id
	 flash[:error] = "Access denied."
	end  

end






end
