class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if !current_user.admin? && !current_user.vip? && current_user != @user
      flash[:alert] = "Access denied."
    else
      @post.update(post_params)
      @post.save
    end
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
