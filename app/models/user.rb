class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

has_many :posts

after_initialize :set_default, :if => :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  
  private
  
  	def set_default
  		self.role ||= :user
  	end
  
end
