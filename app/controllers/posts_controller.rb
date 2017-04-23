class PostsController < ApplicationController


  def update
    @post = Post.find(params[:id])
    @post.update(content: params[:post][:content])
    redirect_to post_path(@post)
  end

end
