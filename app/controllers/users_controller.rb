class UsersController < ApplicationController
	before_filter :admin_only, only: [:destroy]
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # user /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'user was successfully created.'
    else
      render :new
    end
  end

  def update
    current_user.update(user_params)
    redirect_to user_path, :notice => "user updated"
  end
  
  def destroy 
  	current_user.destroy
  	redirect_to users_path, :notice => "user deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:role)
    end
    
    def admin_only
	  	unless current_user.admin?
	  		return head(:forbidden)
	  	end
	  end
	  
end


