class PostsController < ApplicationController

  def edit
  end

  def update
    @post = Post.find(params[:id])
    @post.content = params[:post][:content]
    @post.save
    redirect_to posts_path
  end
end
