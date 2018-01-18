class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'create', :flash => { :notice => @post.errors.full_messages }
    end
  end

  def show
    if !@post
      redirect_to posts_path, :flash => { :notice => "Post not found. "}
    end
  end

  def index
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    if current_user.role == "admin"
      @post.destroy
      redirect_to posts_path, :flash => { :message => "Post #{@post.id} has been deleted."}
    elsif @post.user_id == current_user.id
      @post.destroy
      redirect_to posts_path, :flash => { :message => "Post #{@post.id} has been deleted."}
    else
      redirect_to post_path(@post), :flash => { :error => "You cannot delete this post."}
    end
  end

  private
    def find_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
