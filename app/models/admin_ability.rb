class AdminAbility
  include CanCan::Ability

  # @param [AdminUser] user
  def initialize(user)

    user ||= AdminUser.new

    if user.has_role? :admin
      can :manage, :all
      return
    end

    can :read, ActiveAdmin::Page

    can :index, Organization
    can :create, Organization
    
    events = Event.joins(:organization).where(organization: user.organizations)

    can :manage, Organization, id: Organization.with_role(:admin, user).pluck(:id)
    can :read, user.organizations
    can :manage, Cart, event: events
    can :manage, Event, organization: user.organizations
    can :manage, Payment, cart: {event: events}
    can :manage, Ticket, event: events
    can :manage, TicketOption, event: events
    can :manage, Pass, event: events
    can :create, Pass
    can :manage, Discount, event: events
    can :manage, Invitation, passes: {event: events}
    can :manage, Image, organization: user.organizations

    can :read, User, carts: {event: events, status: %w(bought)}

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
