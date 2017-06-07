class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  enum role: [:user, :vip, :admin]

  after_initialize :set_default_user_role

  def set_default_user_role
    self.role ||= :user
  end

end
