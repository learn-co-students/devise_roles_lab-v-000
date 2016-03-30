class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create

  end

  def show
    @user = current_user
  end

  def edit
    return head(:forbidden) unless current_user
  end

  def update
    return head(:forbidden) unless current_user.admin?
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
  end





end