class PostsController < ApplicationController

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id 
    redirect_to user_path(id: user_id)
  end

  def edit
  end

  def show
  end 

  def update
    @post = Post.find(params[:id])
    if current_user.try(:admin?) || current_user.try(:id) == @post.user_id || current_user.try(:vip?)
      @post.update!(post_params)
      redirect_to post_path, id: @post.id 
    else 
      redirect_to '/', :alert => "Unable to update post."
    end 
  end 



  private

  def post_params
    params.require(:post).permit(:content)
  end 
end
