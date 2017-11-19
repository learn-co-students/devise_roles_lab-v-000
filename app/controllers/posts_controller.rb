class PostsController < ApplicationController
  def new
  end

  def create
    @post = User.posts.build(post_params)
    if @post.save
      redirect_to post_path
    else
      redirect_to :new
    end

  end

  def update
    @post = Post.find_by_id(params[:id])
    return head(:forbidden) unless admin_or_vip?
    @post.update(post_params)
    redirect_to post_path
  end
  
  def post_params
    params.require(:post).permit(:content)
  end
end


