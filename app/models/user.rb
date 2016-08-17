class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Removed :recoverable and :trackable (not necessary for this lab)
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  enum role: [:user, :vip, :admin]     # Rails macro (see below)
  # Passes in a hash: key ('role') is the column name & values are the enums.

  after_initialize :set_default_role, :if => :new_record?

  has_many :posts

  private

  def set_default_role
    self.role ||= :user
  end
end

# ROLES = {
#   0 => :user,
#   1 => :vip,
#   2 => :admin
# }

# def admin?
#   self.role == ROLES.invert[:admin]
# end