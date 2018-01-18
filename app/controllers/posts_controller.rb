class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.content
      @post.user = current_user
      @post.save
      redirect_to post_path(@post)
    else
      redirect_to posts_path, alert: "Post creation was unsuccessful. Please try again."
    end
  end

  def edit
  end

  def update
    if current_user.vip? || current_user.admin? || current_user == @post.user
      @post.update(post_params)
      redirect_to post_path(@post), alert: "Post successfully updated."
    else
      redirect_to post_path(@post), alert: "You are not authorized to perform this action."
    end
  end

  def destroy
    if current_user.admin? || current_user == @post.user
      @post.destroy
      redirect_to posts_path, alert: "Post successfully deleted."
    else
      redirect_to post_path(@post), alert: "You are not authorized to perform this action."
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
