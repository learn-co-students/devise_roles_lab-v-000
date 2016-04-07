class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = "Error"
      redirect_to new_user_post_path(current_user)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to user_posts_path(@post)
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post.delete
    redirect_to user_posts_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:content, :owner_id)
  end
end
