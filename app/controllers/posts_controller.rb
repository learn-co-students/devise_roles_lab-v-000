class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(content: params[:post][:content], user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to post_path(id: @post.id), alert: "Access denied." unless current_user == @post.user || current_user.vip? || current_user.admin?
  end

  def update
    @post = Post.find(params[:id])
    if current_user == @post.user || current_user.vip? || current_user.admin?
      @post.content = params[:post][:content]
      @post.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), alert: "Access denied."
    end
  end

  def destroy

  end
end
