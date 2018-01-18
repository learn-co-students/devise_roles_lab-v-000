class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :rememberable, :validatable,
  :recoverable, :trackable
         
  enum role: [:user, :vip, :admin]

  has_many :posts
  after_initialize :set_default_role


  def guest?
  	!persisted?
  end

  private
	 def set_default_role
	  self.role ||= :user
	 end
end

class NilClass
  def guest?
    true
  end
end


