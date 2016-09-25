class Event < ApplicationRecord
  belongs_to :organization
  has_many :passes

  include StatusConcern
  use_statuses %w(public private closed), default: :private

  validates_presence_of [:name, :start_date, :end_date, :organization]

  scope :not_full, -> {joins('passes').having('sum(passes.tickets_count) < seats OR seats <= 0')}

  before_validation do
    if end_date.nil?
      write_attribute :end_date, start_date
    end
    if seats.nil?
      write_attribute :seats, 0
    end
  end
end
