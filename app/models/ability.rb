class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :update, Post, {user_id: user.id}
    can :delete, Post, {user_id: user.id}
    return if user.user?

    can :update, Post
    return if user.vip?

    can :delete, Post
    can :delete, User
    return if user.admin?
  end
end
