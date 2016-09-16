class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post!, except: [:index, :new, :create]
  before_action :admins_users_only, only: [:new, :create, :destroy]
  before_action :admin_vip_users_only, only: [:edit, :update]

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post
  end

  def edit
    @post
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post!
    @post = Post.find_by(id: params[:id])
  end

  def admins_users_only
    unless @post.user == current_user || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
      return false
    end
  end

  def admin_vip_users_only
    unless @post.user == current_user || current_user.vip? || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
      return false
    end
  end

end
