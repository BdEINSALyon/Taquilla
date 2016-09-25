class Ability
  include CanCan::Ability

  def initialize(user=nil)

    user ||= User.new

    if user.persisted?
      can :read, User
      can :manage, User, id: user.id
    else
      can :create, User
    end

    can :read, Event
    can :read, Pass, status: %w(public public_va)

    can :create, Cart
    can :manage, Cart, user: [nil, user], status: 'buying'
    can :read, Cart, user: user, status: 'bought'

    can :create, Ticket
    can :manage, Ticket, cart: {user: [user, nil], status: 'buying'}, status: 'buying'
    can :update, Ticket, cart: {user: user, status: 'bought'}, status: %w(bought refunded to_refund canceled)
    can :read, Ticket, cart: {user: user, status: 'bought'}

  end
end
