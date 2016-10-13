require 'pry'
class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post!, only: [:edit, :show, :update]
 before_action :check_user!, only: [:edit, :update]

  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
  end

  def create
    user_id = current_user.id
    @post = Post.new(post_params)
    if @post.save
      if current_user
      else
        @post.user = nil
      end
      redirect_to posts_path
    else
      redirect_to post_path, :alert => "Your post couldn't be saved."
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.user_id == current_user.id || current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to posts_path
    else
      redirect_to posts_path, :alert => "Access denied."
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.user_id == current_user.id || current_user.admin? || current_user.vip?
        @post.destroy
        redirect_to posts_path
    else
      redirect_to posts_path, :alert => "You do not have permission to delete this."
    end
  end

private

  def post_params
    params.require(:post).permit(:content)
  end

end
