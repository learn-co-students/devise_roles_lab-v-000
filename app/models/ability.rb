class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # users
    can :show, User, id: user.id
    # Posts
    can :create, Post
    can :show, Post
    can :update, Post, user_id: user.id
    can :destroy, Post, user_id: user.id

    return if user.user?
    # VIP only

    can :update, Post

    return if user.vip?
    # only admins and higher
    can :destroy, User
    can :manage, Post

  end
end
