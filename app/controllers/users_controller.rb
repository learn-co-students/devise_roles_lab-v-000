class UsersController < ApplicationController

  def index
    if current_user && current_user.role == "admin"
      @users = User.all
    else
      redirect_to root_path, :flash => { :error => "Access denied." }
    end
  end

  def show
    if current_user.role == "admin"
      @user = User.find(params[:id])
    elsif current_user.role == "user" || current_user.role == "vip"
      if current_user.id == params[:id].to_i
        @user = User.find(params[:id])
      else
        redirect_to users_path, :flash => { :error => "Access denied." }
      end
    end
  end

  def destroy
    if current_user.role == "user" || current_user.role == "vip"
      redirect_to users_path, :flash => { :error => "Action forbidden." }
    elsif current_user.role == "admin"
      @user = User.find(params[:id])
      @user.delete
      redirect_to users_path, :flash => { :message => "#{@user.name} has been deleted."}
    end
  end

end
