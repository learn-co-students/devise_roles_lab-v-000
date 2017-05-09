class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts=Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save?
      redirect_to post_path(@post)
    else
      :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
    return redirect_to root_path unless current_user.admin?
    @post = Post.find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    unless current_user.admin? || current_user.vip? || current_user == @post.user
      return redirect_to root_path
    end

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      :edit
    end
  end

  def destroy
    return redirect_to root_path unless current_user.admin?
    User.find_by(id: params[:id]).delete
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
