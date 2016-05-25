class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.find(params[:id])
  end

  def edit
     @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     if current_user.admin? || current_user.vip? || current_user == @post.user
       @post.update(content: params[:post][:content])
       redirect_to post_path(@post)
     else
       redirect_to root_path, :alert => "Access denied."
     end
  end

  def destroy
  end
end