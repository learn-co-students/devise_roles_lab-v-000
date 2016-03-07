class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable, :recoverable

  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role

  private
  def set_default_role
    self.role ||= 0 
  end
end
