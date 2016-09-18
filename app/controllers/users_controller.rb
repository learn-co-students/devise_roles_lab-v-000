class UsersController < ApplicationController
  def index
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
end
