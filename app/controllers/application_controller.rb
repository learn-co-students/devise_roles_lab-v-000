class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method :current_user

  def call
    binding.pry
    @current_user || User.find_by_id(session[:id])
  end

end
