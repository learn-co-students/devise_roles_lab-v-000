class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post!, only: [:edit, :show, :update]
  before_action :check_user!, only: [:edit, :update]

  def index
  end

  def new
  end

  def create
    user_id = current_user.id
    Post.create(content: params[:post][:content], user_id: user_id)

    redirect_to user_path(id: user_id)
  end

  def show
  end

  def update
    @post.update(content: params[:post][:content])

    redirect_to post_path(id: @post.id)
  end

  private

  def check_user!
    unless current_user == @post.user || current_user.vip? || current_user.admin?
      redirect_to post_path(id: @post.id)
    end
  end

  def set_post!
    @post = Post.find(params[:id])
  end


end
