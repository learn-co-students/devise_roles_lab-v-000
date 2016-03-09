class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user
  end

  def new
    binding.pry
  end

  def create
    binding.pry
  end

  def show
  end

end
