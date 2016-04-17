class UsersController < ApplicationController

  def show
    if params[:id] != current_user.id
      flash[:error] = "Access denied."
    end
  end

  def create
  end

end