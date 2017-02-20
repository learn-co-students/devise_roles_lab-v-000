class PostsController < ApplicationController

  def update
    @post = Post.find_by(id: params[:id])
    if current_user
      @post.update(post_params) 
      redirect_to post_path(@post)
    end
  end




  private 

    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
