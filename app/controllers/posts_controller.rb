class PostsController < ApplicationController

    def update
        #To anyone who has the missfortune of seeing this, I am sorry.
        if current_user.admin? || current_user.vip?
            Post.find_by(id: params[:id]).update(params.require(:post).permit(:content))
        end
        redirect_to "/"
    end

end
