class Event < ApplicationRecord
  belongs_to :organization

  validates_presence_of :name
  validates_presence_of :status
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :organization

  before_validation do
    if end_date.nil?
      write_attribute :end_date, start_date
    end
    if seats.nil?
      write_attribute :seats, 0
    end
  end

  def self.statuses
    %w(public private closed).map do |status|
      [I18n.t("event.status.#{status}", default: I18n.t("status.#{status}", default: status.to_s.humanize))]
    end
  end
end
