class UsersController < ApplicationController

#  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user.admin? || current_user == @user
    else
      flash[:alert]= 'Access denied.'
      redirect_to :back
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.try(:admin?)
      @user.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  # private
  # def song_params
  #   params.require(:song).permit(
  #     :title, :release_year, :released, :genre, :artist_name
  #   )
  # end
  # def set_user
  #   @user = User.find(params[:id])
  # end
end
