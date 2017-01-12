class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def logged_in?
      !current_user.nil?
    end

    def check_logged_in(&block)
      if logged_in?
        current_user
        yield
      else
        redirect_to new_user_session_path
      end
    end

end
