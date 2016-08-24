class PostsController < ApplicationController
  before_action :set_post

  def create
    @post = User.posts.build(post_params)
    if @post.save
      redirect_to post_path
    else
      redirect_to :new
    end
  end

  def update
    return head(:forbidden) unless admin_or_vip?
    @post.update(post_params)
    redirect_to post_path
  end

  def destroy
    return head(:forbidden) unless admin_or_vip?
  end

  private

  def set_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
