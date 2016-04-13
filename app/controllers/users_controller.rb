class UsersController < ApplicationController

  def index
    redirect_to new_user_session_path unless signed_in?
    @users=User.all
  end

  def new
    @user=User.new
  end

  def create

  end

  def show
# byebug
    @user=User.find_by(id: params[:id])
    authorize! :read, @user
    
  end

  def edit
    @user=User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.admin? || current_user=@user
    

  end

  def update
    return head(:forbidden) unless current_user.admin?
    user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def destroy
    return head(:forbidden) unless current_user.admin?
    User.find_by(user_params).delete
    redirect_to users_path

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :post=>[])
    end

end
