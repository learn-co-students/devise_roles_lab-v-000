class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to user_path(current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_path(current_user)
  end
  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
