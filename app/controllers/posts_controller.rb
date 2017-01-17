class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post, only: [:edit, :show, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def create
    user_id = current_user.id

    Post.create(
      content: params[:post][:content],
      user_id: user_id
    )

    redirect_to user_path(id: user_id)
  end

  def edit
  end

  def update
    @post.update!(content: params[:post][:content])

    redirect_to post_path, id: @post.id
  end

  def destroy
    @post.destroy

    redirect_to posts_path, :notice => "Post has been destroyed"
  end

  private

  def authorize_user!
    raise "You are not authorized" unless current_user

    unless current_user == @post.user || current_user.vip? || current_user.admin?
      redirect_to post_path(id: @post.id), :alert => "Access denied."
    end
  end

  def get_post
    @post = Post.find(params[:id])
  end

end