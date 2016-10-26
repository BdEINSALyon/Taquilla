module CartHelper
  extend ActiveSupport::Concern
  included do
    def cart_for(event, user)
      session[:cart] ||= {}
      cart = nil
      if session[:cart][event.id].nil?
        if user.nil?
          cart = Cart.new event: event
        else
          cart = Cart.find_or_create_by! event: event, user: user
        end
        cart.save!
        session[:cart][event.id] = cart.id
      else
        cart = Cart.find session[:cart][event.id]
        if cart.user.nil? and not user.nil?
          cart.update! user: user
        end
      end
      cart
    end
  end

end