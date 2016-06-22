class PostsController < ApplicationController
  before_action :is_authorized?, only: [:edit, :update]
  before_action :is_admin?, only: [:destroy]

  def new
  end

  def create
    @post = Post.creat(post_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post), alert: "Post updated successfully."
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def is_authorized?
    @post = Post.find(params[:id])
    if current_user != @post.user && !current_user.vip? && !current_user.admin? 
      redirect_to post_path(@post), alert: "Access denied."
    end
  
  end

  def is_admin?
    @post = Post.find(params[:id])
    if !current_user.admin?
      redirect_to post_path(@post), alert: "Access denied."
    end
  end

end
