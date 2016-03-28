class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user != @user
      redirect_to root_path, notice: "Access denied."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
