class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User
    can :create, Post
    can :read, Post
    can :read, User, {id: user.try(:id)}
    can :update, Post, {user: user}
    can :update, Post if user.try(:vip?)
    can :manage, Post if user.try(:admin?)
    can :manage, User if user.try(:admin?)
  end
end
