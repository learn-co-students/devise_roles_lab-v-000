class PostsController < ApplicationController

 def new
   @post = Post.find(params[:id])
 end

 def index
   @posts = Post.all
 end

 def edit
   @post = Post.find(params[:id])
 end

 def update
   @post = Post.find(params[:id])
   if current_user == @post.user || current_user.role == 'vip'|| current_user.role == 'admin'
     @post.update(content: params[:post][:content])
     redirect_to @post
   else
     flash[:error] = "Access denied."
     redirect_to root_path
   end
 end

end
