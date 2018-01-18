class PostsController < ApplicationController
  before_action :post_owner, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params(:content, :username))
    if @post.save
      flash[:success] = "Post sucessfully created"
      redirect_to posts_path
    else
      flash.now[:danger] = "Post was not saved"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params(:content))
    flash[:success] = "Post Updated"
    redirect_to posts_path
  end

  private
  def post_params(*args)
    params.require(:post).permit(args)
  end

  def post_owner
    post = Post.find(params[:id])
    redirect_to posts_path unless post.user == current_user || current_user.admin? || current_user.vip?
  end


end
