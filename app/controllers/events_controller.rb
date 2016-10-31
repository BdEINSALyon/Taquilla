class EventsController < ApplicationController

  def show
    @event = Event.find_by_id(params[:id].to_i)
    @cart = cart_for(@event, current_user) unless current_user.nil?
  end

  private

  include CartHelper
end
