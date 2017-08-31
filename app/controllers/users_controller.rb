class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        if !current_user.admin? && current_user != @user
            flash[:alert] = "Access denied."
            redirect_to '/'
        end
    end

    def update
        @user = User.find(params[:id])
        return head(:forbidden) unless current_user.admin?
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user = User.find(params[:id])
        return head(:forbidden) unless current_user.admin?
        @user.destroy
        redirect_to '/'
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :name)
    end
end
