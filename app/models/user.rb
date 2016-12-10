class User < ActiveRecord::Base
  # belongs_to :role 
 after_initialize :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :rememberable, :validatable
  enum role: [:admin, :vip, :user]

  def set_default_role
    self.role ||= :user 
  end
end
