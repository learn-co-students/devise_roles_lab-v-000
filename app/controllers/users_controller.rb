class UsersController < ApplicationController
  load_resource only: [:edit, :show, :destroy]

  def index
  end

  def show
    authorize! :read, @user
    rescue CanCan::AccessDenied
      flash[:notice] = "Access denied."
      redirect_to action: :index
  end

  def destroy
    authorize! :destroy, @user

    @user.destroy!
    redirect_to '/'

    rescue CanCan::AccessDenied
      redirect_to '/'
  end
end
