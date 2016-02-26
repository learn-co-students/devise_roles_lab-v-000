class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.nil?
      redirect_to new_user_session_path
    else
      post = Post.create(post_params)
      post.user = current_user
      post.save
      redirect_to post_path(post)
    end
  end

  def edit
    @post = set_post
  end

  def show
    @post = set_post
  end

  def update
    post = set_post
    if current_user.nil?
      redirect_to new_user_session_path
    elsif post.user == current_user || current_user.admin?
      post.update(post_params)
      redirect_to post_path(post)
    else
      flash[:alert] = "Access denied."
      redirect_to post_path(post)
    end
  end

  def destroy
    post = set_post
    if current_user.nil?
      redirect_to new_user_session_path
    elsif post.user == current_user || current_user.admin?
      post.destroy
      redirect_to posts_path
    else
      flash[:alert] = "Access denied."
      redirect_to post_path(post)
    end
  end

  private

  def set_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
