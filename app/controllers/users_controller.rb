class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless (@user == current_user)
        redirect_to :root, alert: "Access denied."
      end
    end
  end

  private

    def admin_only
      unless current_user.admin?
        redirect_to :back, alert: "Access denied."
      end
    end
end
