class UsersController < ApplicationController

def edit
end

def index
  @users = User.all
end

def show
  @user = User.find_by(id:params[:id])
  #authorize! :read, @user
end

end
