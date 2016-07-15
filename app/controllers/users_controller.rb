class UsersController < ApplicationController
  
  def destroy
    User.find(params[:id]).destroy if current_user.admin?
    render text: "hello there."
  end
end
