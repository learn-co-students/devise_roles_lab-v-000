class UsersController < ApplicationController
  load_and_authorize_resource

   def destroy
    @user = User.find(params[:id])

    if @user.destroy
        redirect_to root_url, notice: "User deleted."
    end
  end

  def index

  end

  def show
    
  end

end