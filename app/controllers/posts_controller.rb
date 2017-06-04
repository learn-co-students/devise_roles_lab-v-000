class PostsController < ApplicationController
    before_action :set_resource, only: [:show, :edit, :update, :delete]

    def new
        @post = Post.new
        return head(:forbidden) unless user_signed_in?
    end

    def create
        @post = Post.new(post_params)
        return head(:forbidden) unless user_signed_in?
        if @post.save
            redirect_to @post
        else
            redirect_to new_post_path
        end
    end

    def show
    end

    def edit
        return head(:forbidden) unless current_user.id == @post.user_id || current_user.admin? || current_user.vip?
    end

    def update
        return head(:forbidden) unless current_user.id == @post.user_id || current_user.admin? || current_user.vip?
        @post.update(post_params)
        redirect_to @post
    end

    def delete
        return head(:forbidden) unless current_user.id == @post.user_id || current_user.admin?
        @post.destroy
    end

    private

    def set_resource
        @post = Post.find_by(id: params[:id])
    end

    def post_params
        params.require(:post).permit(:content)
    end

end
