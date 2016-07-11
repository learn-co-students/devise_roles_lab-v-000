class PostsController < ApplicationController

  before_action :find_post!, only: [:edit, :show, :update]
  before_action :vip_or_admin_only, only: :update

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
  end

  private

  def find_post!
    @post = Post.find(params[:id])
  end

  def vip_or_admin_only
    unless current_user.admin? || current_user.vip? || current_user == @post.user
      redirect_to posts_path, :alert => "Access denied."
    end
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
