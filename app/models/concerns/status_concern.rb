
module StatusConcern
  extend ActiveSupport::Concern
  included do
    def self.statuses
      @acceptable_statuses.map do |status|
        [I18n.t("#{model_name.i18n_key}.status.#{status}", default: I18n.t("status.#{status}", default: status.to_s.humanize)), status]
      end
    end
  end
  module ClassMethods
    attr_reader :acceptable_statuses

    private

    def use_statuses(statuses, opts={})
      @acceptable_statuses = statuses.map {|e|e.to_s}
      validates_presence_of :status
      validates_inclusion_of :status, in: @acceptable_statuses
      unless opts[:default].nil?
        before_validation do
          if status.nil?
            write_attribute :status, opts[:default].to_s
          end
        end
      end
      scope :with_status, -> (status) {where(status: @acceptable_statuses.include?(status.to_s) ? status.to_s : nil)}
    end
  end
end