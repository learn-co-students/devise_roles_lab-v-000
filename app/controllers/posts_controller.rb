class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :find_post, only: [:update]

  def update
    if current_user.admin? || current_user.vip? || @post.user_id == current_user.id
      @post.update(post_params)
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
