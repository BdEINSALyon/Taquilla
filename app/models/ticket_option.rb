class TicketOption < ApplicationRecord
  has_and_belongs_to_many :tickets
  has_and_belongs_to_many :passes
  belongs_to :event
end
