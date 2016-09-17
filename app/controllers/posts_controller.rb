class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    if !current_user
      flash[:alert] = "Unauthorized!"
    else
      @post = Post.create(content: params[:post][:content], user_id: current_user.id)
      redirect_to post_path(@post)
    end
  end

  def edit
  end

  def show
  end

  def update
    @post = Post.find(params[:id])
    if !current_user
      flash[:alert] = "Unauthorized!"
      redirect_to post_path(@post)
    elsif current_user.id == @post.user_id || current_user.vip? || current_user.admin?
      @post.update(content: params[:post][:content])
      redirect_to post_path(@post)
    else
      flash[:alert] = "Access denied."
      redirect_to post_path(@post)
    end
  end

end
