class PostsController < ApplicationController
  
  def show
  end

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip? || current_user.try(:id) == @post.user.id
    @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip? || current_user.try(:id) == @post.user.id
    @post.destroy
  end

  def post_params
    params.require(:post).permit(:user_id, :content)
  end


end
