class TicketOption < ApplicationRecord
  has_and_belongs_to_many :tickets
  has_and_belongs_to_many :passes
  belongs_to :event

  include StatusConcern
  use_statuses %w(opened closed), default: :opened

  validates_presence_of :event

  def real_tickets
    tickets.where(status: [:bought, :used])
  end
end
