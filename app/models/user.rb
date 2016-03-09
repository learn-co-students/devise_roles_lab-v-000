class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    private

    def default_role
      self.role = 0
    end

end
