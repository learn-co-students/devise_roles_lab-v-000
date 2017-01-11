class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :rememberable, :validatable
  # , :recoverable, :trackable,
  enum role: [:user, :vip, :admin]

end
