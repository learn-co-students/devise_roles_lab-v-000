class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
    
  after_initialize :set_default_role

  private
    def set_default_role
      self.role ||= :user
    end
end
