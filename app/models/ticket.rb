class Ticket < ApplicationRecord
  belongs_to :pass, counter_cache: true
  has_one :event, through: :pass
  has_one :organization, through: :pass

  include StatusConcern
  use_statuses %w(buying bought used refunded canceled), default: :buying

  validates_presence_of :pass

  before_validation do
    if status.nil?
      write_attribute :status, 'buying'
    end
  end

  scope :valid_for_access, -> {where(status: %w(bought)).includes(:pass).where('passes.entry_closed > ?', Time.now)}

  def self.clean_buying_tickets
    Ticket.with_status('buying').where('updated_at < ?', 12.hours.ago).delete_all
  end

end
