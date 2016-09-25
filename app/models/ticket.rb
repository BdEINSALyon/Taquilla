class Ticket < ApplicationRecord
  belongs_to :pass, counter_cache: true
  belongs_to :cart
  has_one :event, through: :pass
  has_one :organization, through: :pass
  has_and_belongs_to_many :ticket_options
  belongs_to :invitation

  include StatusConcern
  use_statuses %w(buying bought used refunded canceled), default: :buying

  validates_presence_of :pass

  scope :valid_for_access, -> {where(status: %w(bought)).includes(:pass).where('passes.entry_closed > ?', Time.now)}

  def self.clean_buying_tickets
    Ticket.with_status('buying').where('updated_at < ?', 12.hours.ago).delete_all
  end

  def name
    pass.name
  end

  def price
    pass.price + ticket_options.pluck(:price).sum
  end

end
