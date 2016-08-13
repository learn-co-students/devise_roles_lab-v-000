class Ability
  include CanCan::Ability


# Posts can be created by any user
# Anyone can read any post
# Users can edit or delete Posts they own
# VIPs can edit anyone's Posts
# Admins can do anything to any post.

  def initialize(user)
    can :create, Post
    can :read, Post
 
    can :update, Post, {user_id: user.id}
    can :delete, Post, {user_id: user.id}
    return if user.user?
 
    can :update, Post
    return if user.vip?
 
    can :manage, Post if user.admin?
    can :manage, User if user.admin?
  end
end
