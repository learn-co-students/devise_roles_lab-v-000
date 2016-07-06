class PostsController < ApplicationController
  before_action :signed_in?, except: [:index, :show]
  before_action :edit_post, only: [:edit, :update]
  before_action :delete_post, only: [:delete]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def signed_in?
    unless current_user
        redirect_to '/posts', alert: "You're not signed in."
    end
  end

  def edit_post
    post = Post.find_by(id: params[:id])
    unless current_user.try(:id) == post.user_id || current_user.try(:admin?) || current_user.try(:vip?)
      redirect_to '/posts', alert: "Access denied."
    end
  end

  def delete_post
    post = Post.find_by(id: params[:id])
    unless current_user.try(:id) == post.user_id || current_user.try(:admin?) 
      redirect_to '/posts', alert: "Access denied."
    end
  end

end
