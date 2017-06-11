class UsersController < ApplicationController

    def destroy
        if current_user.admin?
            User.find_by(id: params[:id]).destroy
        end
        redirect_to root_path
    end

    def show
        @user = User.find_by(id: params[:id])
        if(@user!=current_user)
            flash[:error] = "Access denied."
            redirect_to root_path
        end
    end

end
