class Ability
  include CanCan::Ability

  def initialize(user)

    return if user.nil?

    if user.admin?
        can :manage, :all
    elsif user.vip?
        can :manage, Post
    elsif user.user?
        can :read, Post
        can :manage, Post, :user_id => user.id
        can :manage, User, :id => user.id
    else
        can :read, Post
    end

    can :read, User, :id => user.id
    
  end


end
