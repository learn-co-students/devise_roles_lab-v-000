class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  has_many :posts
  
  def role
    @role.nil? && @role = :user
    @role.to_s
  end
  
  def role=(r)
    @role = r
  end
end
