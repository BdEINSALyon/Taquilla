class EventsController < ApplicationController
  def show
    @event = Event.find_by_id(params[:id].to_i)
    session[:cart] ||= {}
    if session[:cart][@event.id].nil?
      if current_user.nil?
        @cart = Cart.new event: @event
      else
        @cart = Cart.find_or_create_by! event: @event, user: current_user
      end
      @cart.save!
      session[:cart][@event.id] = @cart.id
    else
      @cart = Cart.find session[:cart][@event.id]
      if @cart.user.nil? and not current_user.nil?
        @cart.update! user: current_user
      end
      unless @cart.user.id == current_user.id
        session[:cart][@event.id] = nil
        redirect_to action: :show
      end
    end
  end
end
