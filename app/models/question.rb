class Question < ApplicationRecord
  QUESTION_TYPES = ['TEXT', 'IMAGE']

  validates :name, presence: true, uniqueness: {scope: :formulary_id}

  validates_inclusion_of :question_type, :in => QUESTION_TYPES,
            :message => "question_type must be in #{QUESTION_TYPES.join ', '}."

  belongs_to :formulary
  has_many :answers
end
