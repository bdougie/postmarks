class Ability
  include CanCan::Ability

  def initialize(user)
    
    # if a member, they can manage their own posts 
    # (or create new ones)

    user ||= User.new # guest user (not logged in)
    if user.role? :member
         can :manage, Bookmark, :user_id => user.id
         can :manage, Favorite, user_id: user.id
         can :create, Vote
         can :read, Topic
    end

    # Admins can do anything
    if user.role? :admin
        can :manage, :all
    end

        can :read, Bookmark      
  end
end