class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    post = Post.find(params[:id]) 
  end

  def edit
    post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if current_user.admin? || current_user.vip? || current_user.try(:id) == post.id
    post.update(post_params)
    redirect_to root_path
    else
      return head(:forbidden)
      render 'edit'
    end
  end

  # def destroy
  #   post = Post.find(params[:id])
  #   if current_user.try(:admin?) || current_user.posts.include?(post)
  #     post.delete
  #     redirect_to root_url
  #   else
  #     render "index"
  #   end
  # end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
