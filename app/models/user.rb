class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  private
    def set_default_role
      self.role ||= :user
    end
end
