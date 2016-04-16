class User < ActiveRecord::Base
  # devise :database_authenticatable, :registerable, :confirmable,
        #  :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum role: [:user, :vip, :admin]
  after_initialize :set_role, if: :new_user?

  private
  def set_role
    self.role ||= :user
  end

  def new_user?
    self.new_record?
  end
end
