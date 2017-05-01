module PostsHelper

  def can_edit_post(post)
    if current_user.role == "admin" ||current_user.role == "vip" || post.user_id == current_user.id
      return true
    else
      return false
    end
  end
end
