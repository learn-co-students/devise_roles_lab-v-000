class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: session[:user_id])
  end

  def show
  end
end
