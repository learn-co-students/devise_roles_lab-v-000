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
      @post = Post.find_or_create_by(post_params(:content))
      redirect_to post_path(@post)
    end

    def update
      return head(:forbidden) unless current_user.role == "vip" || current_user.role == "admin" || current_user.id == @post.user_id
      @post.update(content: params[:post][:content])
      redirect_to post_path(@post)
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

end
