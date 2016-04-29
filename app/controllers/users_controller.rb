class UsersController < ApplicationController
  #authentication filter
  before_action :authenticate_user, except: [:create, :new]
  #authorization filter
  before_action :authorize_user, except: [:create, :index, :new]
  # only admin can update or destroy users
  before_action :admin_user, only: [:update, :destroy]

  def destroy
    @user.destroy
    redirect_to '/'
  end

  private

    def authenticate_user
      @user = User.find(params[:id])
    end

    def authorize_user
      raise "Not Authorized" unless current_user

      unless current_user.admin? || current_user.vip?
        render :text => "You're not authorized to see that."
      end
    end

    def admin_user
      unless current_user.admin? || @user == current_user
        redirect_to users_path, :alert => "You're not an administrator allowed to see such things."
      end
    end
end