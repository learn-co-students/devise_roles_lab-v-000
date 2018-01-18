
class PostsController < ApplicationController
  before_action :set_post!, except: [:index, :new, :create]

 def index
   @posts = Post.all
 end

 def new
   @post = Post.new
 end

 def create
   @post = Post.create(post_params)
   redirect_to @post
 end

 def edit
   if current_user.user?
     redirect_to root_path unless current_user.id == @post.user_id
   end
 end

 def update
   if current_user.user?
     redirect_to root_path unless current_user.id == @post.user_id
   else
     @post.update(post_params)
     redirect_to @post
   end
 end

 def destroy
   if current_user.user?
     redirect_to root_path
   else
     @post.destroy
     redirect_to root_path
   end
 end

 private

 def post_params
   params.require(:post).permit(:content, :owner_id)
 end

 def set_post!
   @post = Post.find(params[:id])
 end
end
