class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise  :database_authenticatable, :registerable, 
          :recoverable, :rememberable, :trackable, :validatable
  
  enum role: [:admin, :vip, :user]

  after_initialize :default_role

  has_many :posts

  private

  def default_role
    self.role ||= :user
  end

end
