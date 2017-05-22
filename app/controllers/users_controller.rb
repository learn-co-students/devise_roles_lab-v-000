class UsersController < ApplicationController

  def show
    redirect_to :back, :alert => "Access denied." unless current_user.try(:id) == params[:id].to_i || current_user.admin?
  end

  def destroy
    if current_user.admin?  
      User.find(params[:id]).delete
    else
      redirect_to root_path, :alert => "Access denied."
    end 
  end
end
