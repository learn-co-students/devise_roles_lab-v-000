class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  has_many :posts
  devise :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :database_authenticatable 
  enum role: [:user, :vip, :admin]

end
