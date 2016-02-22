class PostsController < ApplicationController

  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def show
    @post = Post.find(params[:id])
  end




end ## class end
