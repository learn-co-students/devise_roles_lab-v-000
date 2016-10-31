class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :rememberable
  
  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role

  private

    def set_default_role
      self.role ||= :user
    end
end
