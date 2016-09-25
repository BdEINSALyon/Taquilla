class Payment < ApplicationRecord
  belongs_to :cart

  include StatusConcern
  use_statuses %w(paying paid refunded canceled to_refund), default: :paying

  validates_presence_of [:cart, :amount, :method]
  validates_inclusion_of :amount, in: (0..cart.amount)

  before_validation do
    if amount.nil?
      write_attribute :amount, cart&.amount
    end
  end
end
