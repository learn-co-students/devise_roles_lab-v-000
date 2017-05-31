class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :show_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @Post.save
      redirect_to @post
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def show
  end

  def update
    @post.update!(post_params)
    redirect_to @post
  end

  def destroy
  end

  private

  def authorize_user!
   raise "Unauthorized!" unless current_user

   unless current_user == @post.user || current_user.vip? || current_user.admin?
     redirect_to post_path(id: @post.id), :alert => "Access denied."
   end
 end

  def post_params
    params.required(:post).permit(:content, :user_id)
  end

  def show_post
    @post = Post.find_by(id: params[:id])
  end
end
