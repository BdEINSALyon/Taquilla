module CartHelper
  extend ActiveSupport::Concern
  included do
    # @return [Cart]
    # @param [Event] event
    # @param [User] user
    def cart_for(event, user)
      session[:cart] ||= {}
      if user.nil? or event.nil?
        raise Exception.new 'Can not get a cart for nil event or nil user!'
      end
      if session[:cart][event.id.to_s].nil?
        if user.nil?
          cart = Cart.new event: event
        else
          cart = Cart.find_or_create_by! event: event, user: user
        end
        cart.save!
        session[:cart][event.id.to_s] = cart.id
      else
        cart = Cart.find session[:cart][event.id.to_s]
        if cart.user.nil? and not user.nil?
          cart.update! user: user
        end
      end
      cart
    end
  end

end