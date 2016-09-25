class Ticket < ApplicationRecord
  belongs_to :pass, counter_cache: true
  has_one :event, through: :pass
  has_one :organization, through: :pass

  validates_presence_of [:status, :pass]
  validates_inclusion_of :status, in: %w(buying bought used refunded canceled)

  before_validation do
    if status.nil?
      write_attribute :status, 'buying'
    end
  end

  scope :valid_for_access, -> {where(status: %w(bought)).includes(:pass).where('passes.entry_closed > ?', Time.now)}
  scope :with_status, -> (status) {where(status: status)}

  def self.clean_buying_tickets
    Ticket.with_status('buying').where('updated_at < ?', 12.hours.ago).delete_all
  end

  def self.statuses
    %w(buying bought used refunded canceled).map do |status|
      [I18n.t("ticket.status.#{status}", default: I18n.t("status.#{status}", default: status.to_s.humanize))]
    end
  end
end
