class Answer < ApplicationRecord
  belongs_to :ticket
  belongs_to :question
  belongs_to :answerable, polymorphic: true
end
