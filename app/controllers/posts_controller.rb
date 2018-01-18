class PostsController < ApplicationController

  def create
    @post = Post.create
    return head(:forbidden) unless current_user.user?
    redirect_to root_path
  end

  def show
    @post = Post.find_by(id: params[:id])
  end 

  def update
    @post = Post.find_by(id: params[:id])
    return head(:forbidden) unless current_user.admin? ||
                       current_user.vip?
    @post.update(content: params[:post][:content])
    redirect_to root_path
  end

end
