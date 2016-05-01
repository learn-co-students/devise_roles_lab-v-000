class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end


  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user_id)
    end

end