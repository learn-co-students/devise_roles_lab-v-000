class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :post
  before_action :authorize_user, only: [:update, :destroy]


  def new
    @post = Post.new
  end

  def update
    @post.update(content: params[:post][:content])
    redirect_to post_path, id: @post.id
  end

  def create
    binding.pry
    binding.pry if @post.content == "bar10"
    @post.update(user: current_user)
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def authorize_user
    unless current_user.admin? || current_user.vip? || current_user == @post.user
      redirect_to '/', alert: "Access denied"
    end
  end

  def post
    @post = Post.find(params[:id])
  end
end
