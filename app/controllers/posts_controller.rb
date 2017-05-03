class PostsController < ApplicationController
  before_action :set_post!, only: [:edit, :show, :update]
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    @post.id = current_user.id
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def authorize_user!
    raise "You must log in." unless current_user
    unless @user == current_user || current_user.vip? || current_user.admin?
      redirect_to post_path(@post)
    end
  end

  def set_post!
    @post = Post.find(params[:id])
  end

end
