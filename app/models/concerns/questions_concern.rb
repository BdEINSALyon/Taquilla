
module QuestionsConcern
  extend ActiveSupport::Concern
  included do
    has_many :questionings, as: :questionable
    has_many :questions, through: :questionings
    has_many :answers, as: :answerable
  end
end