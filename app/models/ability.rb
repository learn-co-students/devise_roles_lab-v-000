class Ability
  include CanCan::Ability

  def initialize(user)
    user.can :read, Post
    user.can :manage, Post, {user_id: user.id}
    return if user.user?

    user.can :destroy, User if user.admin?
  end
end
