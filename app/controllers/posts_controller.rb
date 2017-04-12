class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end
    def create
        @post = current_user.posts.create(post_params)
        if @post.save 
            redirect_to posts_path     
        else
            render :new
        end
    end
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path     
        else
            render :edit
        end
    end
    def edit
        @post = Post.find(params[:id])
        return head(:forbidden) unless user_can_edit?
            
    end
    def destroy
        @post = Post.find(params[:id])
        return head(:forbidden) unless user_can_delete?
        @post.destroy
        redirect_to posts_path
    end
    def show
        @post = Post.find(params[:id])
    end    
    
    private
    def user_can_edit?
        current_user.admin? || current_user.vip? || current_user.id == @post.id
    end
    def user_can_delete?
        current_user.admin? || current_user.id == @post.id
    end
    
    def post_params
        params.require(:post).permit(:content) 
    end
end