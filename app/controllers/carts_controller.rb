class CartsController < ApplicationController

  before_action do
    @event = Event.find(params[:event_id])
    @cart = cart_for @event, current_user
  end

  def answers
    if @cart.status.to_sym == :buying
      if @cart.user.nil?
        redirect_to @event
      end
      @cart.status = :answers
      @cart.save!
    end
  end

  def show
  end

  def update
    up = params[:update]
    case up
      when 'tickets_count'
        tickets_count = params.require(:tickets).permit!
        tickets_count.each do |pass_id, count|
          count = count.to_i
          pass = GlobalID::Locator.locate_signed pass_id
          unless pass.nil?
            actual_count = @cart.tickets_for_pass(pass).count
            if actual_count < count
              (count - actual_count).times do
                @cart.tickets.create pass: pass
              end
            elsif actual_count > count
              (actual_count - count).times do
                @cart.tickets_for_pass(pass).first.destroy
              end
            end
          end
        end
      else
        # type code here
    end
    @cart.save!
    render action: :show
  end

  private

  include CartHelper

end
