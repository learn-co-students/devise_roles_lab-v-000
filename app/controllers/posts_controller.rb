class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:edit, :update, :show, :destroy]
    before_action :authorize_user, only: [:edit, :update, :destroy]
    
    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to @post
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        @post.update_attributes(post_params)
        if @post.save
            redirect_to @post
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def set_post
        @post = Post.find_by(id: params[:id])
    end

    def post_params
        params.require(:post).permit(:content, :user_id)
    end

    def authorize_user
        unless current_user == @post.user || current_user.vip? || current_user.admin?
            redirect_to posts_path, :alert => "Access denied."
        end
    end
end
