class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    check_logged_in
    @post = Post.new
  end

  def create
    check_logged_in
    post = Post.new(post_params)
    post.user = current_user
    post.save!
    redirect_to post_path(post), :notice => "Post created."
  end

  def edit
    @post = Post.find(params[:id])
    check_privileged_post_permissions(@post)
  end

  def update
    post = Post.find(params[:id])
    check_privileged_post_permissions(post)
    post.update(post_params)
    redirect_to post_path(post), :notice => "Post update."
  end

  def destroy
    post = Post.find(params[:id])
    check_privileged_post_permissions(post)
    post.destroy
    redirect_to posts_path, :notice => "Post deleted."
  end

  #---------------------
  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def admin_or_vip
    unless current_user.admin? || current_user.vip?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def check_logged_in
    unless user_signed_in?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def check_privileged_post_permissions(post)
    unless user_signed_in?
      redirect_to :back, :alert => "Access denied."
    end

    unless current_user.vip? || current_user.admin? || post.user.id == current_user.id
      redirect_to :back, :alert => "Access denied."
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
