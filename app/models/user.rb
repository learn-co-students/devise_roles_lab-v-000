class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]

  has_many :posts

  #In my lab, I set default to "user" in the migration. Avi video shows how to do it like this:
  #
  #after_initialize :set_default_user_role
  #
  #def set_default_user_role
  #   self.role = :user
  #end
end
