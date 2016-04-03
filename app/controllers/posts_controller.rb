class PostsController < ApplicationController

  before_action :authenticate_user!, except: :show
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @user = User.find(@post.owner_id)
    unless current_user.admin?
      unless current_user.vip?
        unless @user == current_user
          redirect_to :back, alert: "Access denied."
        end
      end
    end
    @post.update_attributes(post_params)
    redirect_to post_path(@post), notice: "Post updated."
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(@post.owner_id)
    unless current_user.admin?
      unless current_user.vip?
        unless @user == current_user
          redirect_to :back, alert: "Access denied."
        end
      end
    end
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end