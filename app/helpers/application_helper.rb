module ApplicationHelper
  def welcome_message_for(current_user)
    if current_user
      "Welcome, #{current_user.email}!"
    else
      "Welcome!"
    end
  end

  def navbar_login_for(current_user)
    if current_user
      link_to "Sign out", destroy_user_session_path, method: "delete"
    else
      link_to "Sign In", new_user_session_path
      link_to "Sign up", new_user_registration_path
    end
  end
end
