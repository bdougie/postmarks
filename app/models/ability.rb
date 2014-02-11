class Ability
	include Cancan::Ability

	def initialize(user)

		user ||= User.new
		if user.role? :member
			can :manage, Bookmark, :user_id => user.id
		end

		if user.role? :admin
        can :manage, :all
    end

    can :read, Bookmark
  end

end
