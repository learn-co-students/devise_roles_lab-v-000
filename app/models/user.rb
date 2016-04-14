class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :vip, :user]

  after_initialize :set_default_role

  private
  def set_default_role
    self.role ||= :user
  end
end
