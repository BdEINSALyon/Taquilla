class Cart < ApplicationRecord
  include StatusConcern
  use_statuses %w(buying bought), default: :buying

  has_many :tickets
  has_many :events, through: :tickets
  belongs_to :discount
  belongs_to :event
  belongs_to :user
  has_many :payments

  validates_presence_of :event

  scope :buying, -> {where(status: 'buying')}
  scope :bought, -> {where(status: 'bought')}

  def amount
    amount = tickets.to_a.pluck(:price).sum
    amount = discount.compute(amount) unless discount.nil? or discount.event != event
    amount
  end

end
