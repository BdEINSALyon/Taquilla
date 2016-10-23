class Questioning < ApplicationRecord
  belongs_to :question
  belongs_to :questionable, polymorphic: true
end
