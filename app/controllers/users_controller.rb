class UsersController < ApplicationController

  def new
  end

  def index
    if current_user
      @email = current_user.email if current_user
    else
      @email = 'guest'
    end
  end

  def show
    if params[:id] == 'sign_out'
      redirect_to new_user_session_path
    end
    if current_user
      redirect_to root_path, alert: "Access denied." unless (current_user.id == params[:id].to_i || current_user.admin? || current_user.vip?)
      @email = current_user.email
    else
      @email = 'guest'
    end
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    user = User.find_by(id: params[:id])
    user.destroy if !user.nil?
    redirect_to users_path
  end

end
