class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user && (logged_in(@user))
      render :show
    else
      flash[:error] = "Access denied."
      redirect_to '/'
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    if current_user.admin? 
      User.find(params[:id]).destroy
    end
    redirect_to '/'
  end

  private
  def logged_in(user)
    if current_user
      return current_user.id == user.id
    else
      return false
    end
  end

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return false
    end
  end

end
