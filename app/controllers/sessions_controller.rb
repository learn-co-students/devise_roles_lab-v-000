class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to '/login' unless params[:email]
    session[:user_id] = User.find_or_create_by(email: params[:email]).id
    redirect_to '/'
  end

  def destroy
    session.delete :user_id
    redirect_to '/users/sign_in'
  end

end
