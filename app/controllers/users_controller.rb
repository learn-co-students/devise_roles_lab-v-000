class UsersController < ApplicationController
  #before_action :set_resource


  def index


  end

  def new

  end

  def show
  
    if current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
    elsif current_user.admin?
      binding.pry
      @user = User.find(params[:id])
    else
    
      flash[:message] = "Access denied."
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
    


  end

  






end