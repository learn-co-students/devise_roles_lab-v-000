class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)

    if post.save
      redirect_to post_path(post)
    else
      redner :new
    end
  end

  def edit
    if !can_edit?
      redirect_to root_path, notice: 'Access denied'
    end
  end

  def update
    if can_edit?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to root_path, notice: 'Access denied'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def can_edit?
    @post.user == current_user || current_user.admin? || current_user.vip?
  end

end
