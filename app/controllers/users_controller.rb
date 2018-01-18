class UsersController < ApplicationController
    before_action :set_user, except: [:create, :index, :new]
    before_action :authenticate_user!, except: [:create, :new, :index]
    before_action :admin_only, only: :destroy

    def index
        @users = User.all
    end

    def show
        if !current_user.admin? && current_user != @user
            redirect_to :back, :alert => "Access denied."
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        @user.update_attributes(user_params)
        if @user.save
            redirect_to @user
        else
            render :edit
        end
    end
    
    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def admin_only
        redirect_to users_path unless current_user.admin?
    end

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
