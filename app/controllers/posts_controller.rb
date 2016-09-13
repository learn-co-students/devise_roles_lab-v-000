class PostsController < ApplicationController
   before_action :authenticate_user!

  def update
    post = Post.find(params[:id])
    post.update(content: params[:post][:content])
    redirect_to post_path, id: post.id
  end
end
