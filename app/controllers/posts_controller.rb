class PostsController < ApplicationController 
  def show 
    @post = Post.find_by(params[:id])
  end
  
  def new 
    @post = Post.new      
  end
  
  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    @post.save
    redirect_to post_path(@post) 
  end
  
  def edit 
    @post = Post.find_by(id: params[:id]) 
    #binding.pry
    unless @post.user_id == current_user.id || current_user.try(:admin?) || current_user.try(:vip?)
      redirect_to root_path, notice: "Access denied."
    end
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end
  
  def destroy 
    @post = Post.find_by(id: params[:id]) 
    unless @post.user_id == current_user.id || current_user.try(:admin?) || current_user.try(:vip?)
      redirect_to root_path, notice: "Not Allowed to delete."
    else
      @post.destroy
      redirect_to root_path, notice: "Sucessfully Deleted"     
    end
  end
  
private
  def post_params
    params.require(:post).permit(:content)
  end
end
