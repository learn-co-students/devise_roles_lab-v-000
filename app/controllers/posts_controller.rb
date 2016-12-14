class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
  end


  def update
    post = Post.find(params[:id])
    if current_user.role == "user"
      flash.alert = 'Access denied.'
      redirect_to post_path(post)
    else
      post.update(get_params)
      redirect_to post_path(post)
    end
  end

  private

  def get_params
    params.require(:post).permit(:content)
  end
end
