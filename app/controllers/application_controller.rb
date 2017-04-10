class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to root_path, alert: "Access denied." unless logged_in?
  end

  def ensure_vip
    unless current_user.vip? || current_user.admin?
      redirect_to root_path, alert: "Access denied."
    end
  end

  def ensure_admin
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
