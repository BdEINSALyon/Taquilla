class Cart < ApplicationRecord
  include StatusConcern
  use_statuses %w(buying bought), default: :buying

  has_many :tickets
  has_many :events, through: :tickets
  belongs_to :discount
  belongs_to :event

  validates_presence_of :event

  scope :buying, -> {where(status: 'buying')}
  scope :bought, -> {where(status: 'bought')}

end
