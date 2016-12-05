class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new
    @post.content = params[:post][:content]
    if @post.save
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  def update
    post = Post.find(params[:id])
    user = post.user
    if current_user.admin? || current_user.vip?
      post.update(content: params[:post][:content])
    else
      redirect_to users_path
    end
  end
end
