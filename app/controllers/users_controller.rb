class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        @user = current_user.users.create(user_params)
        if @user.save 
            redirect_to users_path     
        else
            render :new
        end
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to users_path     
        else
            render :edit
        end
    end
    def edit
        @user = User.find(params[:id])
        return head(:forbidden) unless user_can_edit?

    end
    def destroy
        @user = User.find(params[:id])
        return head(:forbidden) unless user_can_delete?
        @user.destroy
        redirect_to users_path
    end
    def show
        @user = User.find(params[:id])
    end    

    private
    def user_can_edit?
        current_user.admin? || current_user.vip? || current_user.id == @user.id
    end
    def user_can_delete?
        current_user.admin?
    end

    def user_params
        params.require(:user).permit(:content) 
    end
end