class CartsController < ApplicationController

  before_action do
    @event = Event.find(params[:event_id])
    @cart = cart_for @event, current_user
  end

  def show
  end

  def update

  end

  private

  include CartHelper

end
