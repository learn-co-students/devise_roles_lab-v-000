class Post < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  validates_presence_of :content

end
