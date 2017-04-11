class UsersController < ApplicationController


 def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.delete
    redirect_to root_path
  end

  def index
  end

  def show
  @user = User.find_by(id: params[:id])
  unless current_user.admin?
    unless @user.id == current_user.id
      redirect_to root_path, :alert => "Access denied."
    end
  end
end


  def edit
  end

  def update
  end


end
