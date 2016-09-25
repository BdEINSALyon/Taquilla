class Pass < ApplicationRecord
  belongs_to :event
  has_one :organization, through: :event
  has_many :tickets

  validates_presence_of [:name, :price, :event]
  validates_inclusion_of :price, in: [0]+1..nil
  validates_inclusion_of :status, in: %w(public invitation closed public_va invitation_va)
  validates_exclusion_of [:entry_start, :entry_end, :pass_start, :pass_end], in: ->(p) {p.event&.start_date..p.event&.end_date}

  scope :not_full, -> {where('tickets_count < seats OR seats <= 0')}

  def self.statuses
    %w(public invitation closed public_va invitation_va).map do |status|
      [I18n.t("ticket.status.#{status}", default: I18n.t("status.#{status}", default: status.to_s.humanize))]
    end
  end
end
