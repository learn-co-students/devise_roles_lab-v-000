class UsersController < ApplicationController
  def index
  end

  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? ||
                   current_user.try(:id) == @post.id
    @post.update(post_params)
  end
end
