require 'pry'
class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(post_params)

    else
           redirect_to post_path(@post.id)

    end
  end


private

  def post_params
      params.require(:post).permit([:content])
  end

end
