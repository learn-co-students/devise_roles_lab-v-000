class PostsController < ApplicationController
  def index
    render 'users/show'
  end

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = "Error"
      redirect_to new_user_post_path(current_user)
    end
  end



  private
  def post_params
    params.require(:post).permit(:content, :owner_id)
  end
end
