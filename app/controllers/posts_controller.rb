class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]
  before_action :admin_vip_or_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    user_id = current_user.id
    @post = Post.create(post_params)
    @post.user_id = user_id
    @post.save
    redirect_to post_path(@post), notice => "Successfully created post."
  end

  def show

  end

  def edit

  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post), notice => "Successfully updated post."
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice => "Successfully deleted post."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def admin_vip_or_owner
    if current_user
      return head(:forbidden) unless current_user.admin? || current_user.id == @post.user_id || current_user.vip?
    else
      return head(:forbidden)
    end
  end

  def post_params
    params.require(:post).permit(:content, :subject)
  end
end
