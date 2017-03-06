class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update]

    def index
        @posts = Post.all
    end

    def show

    end

    def new
        @post = Post.new
    end

    def edit

    end

    def create
        binding.pry
        @post = Post.find_or_create_by(post_params(:content))
        redirect_to post_path(@post)
    end

    def update
        binding.pry
        return head(:forbidden) unless current_user.role > 0 || current_user.id == post.user_id
        @post.update(post_params(:content))
        redirect_to post_path(@post)
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params(*args)
      binding.pry
      params.require(:post).permit(*args)
    end

end