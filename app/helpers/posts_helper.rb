module PostsHelper
  def current_user
    User.find_by(id: session[:id])
  end
end
