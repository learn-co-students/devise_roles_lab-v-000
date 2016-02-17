class PostsController < ApplicationController 

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    logged_in
    @post = Post.new
  end

  def create
    logged_in
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
    post_permission(@post)
  end 

  def update 
    @post = Post.find(params[:id])
    post_permission(@post)
    @post.update(post_params)
    redirect_to post_path(@post), notice: "Your post has been updated"
  end 

  def destroy
    @post = Post.find(params[:id])
    post_permission(@post)
    @post.destroy
    redirect_to posts_path, notice: "The post has been deleted"
  end 

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def logged_in
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "Access denied"
    end 
  end

  # def user_admin
  #   unless current_user.admin? 
  #     redirect_to new_user_session_path, alert: "Access denied"
  #   end 
  # end 

  # def user_vip_admin
  #   unless current_user.admin? || current_user.vip? 
  #     redirect_to new_user_session_path, alert: "Access denied"
  #   end 
  # end

  def post_permission(post)
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "Access denied"
    end

    unless current_user.vip? || current_user.admin? || post.user.id == current_user.id
      redirect_to new_user_session_path, alert: "Access denied"
    end 
  end




end #ends class 