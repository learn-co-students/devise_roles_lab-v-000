class PostsController < ApplicationController

  def create
  end

  def edit
  end

  def show
  end 

  def update

  end

  private

  def post_params
    params.require(:post).permit(:content)
  end 
end
