module PostsHelper
  def authorize_user
    return head(:forbidden) unless current_user
  end

  def authorize_update
    return head(:forbidden) unless current_user.admin? || current_user.vip? || current_user.try(:id) == @post.id
  end

  def authorize_delete
    return head(:forbidden) unless current_user.admin? || current_user.try(:id) == @post.id
  end
end
