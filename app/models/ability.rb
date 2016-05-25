class Ability
  include CanCan::ability

  def initialize(user)
    user.can :read, Post
    return if user.guest?

    user.can :update, Post, {owner_id: user.id}
    return if user.normal?

    user.can :manage, Post if user.admin?
  end
end
