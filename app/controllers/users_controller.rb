class UsersController < ApplicationController


  before_action :authenticate_user!, except: [:index, :new, :create]
    before_action :admin_only, only: :destroy

    def index
      @users = User.all
      @user = current_user
    end

    def show
      # a really low level - manual implementation of permissions
      # ex. if current_user is an admin (id: 1) and goes to /users/2,
      ## they should still be able to view the other user's page.
      unless current_user.admin? || current_user == @user
        redirect_to root_path, alert: "Access denied."
      end
    end

    def destroy
      @user = User.find_by(params[:id])
      return head(:forbidden) unless current_user.admin?
      @user.destroy
      redirect_to root_path, notice: "User has been deleted."
    end


    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def admin_only
      unless current_user.admin? || current_user == @user
        redirect_to users_path, alert: "Access denied."
      end
    end

end
