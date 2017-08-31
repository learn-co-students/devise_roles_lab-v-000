class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: { :user => 2, :vip => 1, :admin => 0 }

  has_many :posts

  def admin?
    self.role == "admin"
  end
  
  def vip?
    self.role == "vip"
  end
  
  def user?
    self.role == "user"
  end
  
end
