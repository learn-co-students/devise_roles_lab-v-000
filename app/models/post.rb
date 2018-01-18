class Post < ActiveRecord::Base
    belongs_to :user
    
    def user_name
        user.name
    end
end
