class Pass < ApplicationRecord
  belongs_to :event
  has_one :organization, through: :event
  has_many :tickets
  has_and_belongs_to_many :ticket_options
  has_and_belongs_to_many :invitations

  include StatusConcern
  use_statuses %w(public invitation closed public_va invitation_va), default: :closed

  include QuestionsConcern

  validates_presence_of [:name, :price, :event]
  validates_inclusion_of :price, in: (0..20000)
  validates_exclusion_of [:entry_start, :entry_closed, :pass_start, :pass_end], in: ->(p) {p.event&.start_date..p.event&.end_date}

  scope :not_full, -> {where('tickets_count < seats OR seats <= 0')}

end
