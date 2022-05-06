class Visit < ApplicationRecord

  STATUSES = ['PENDING', 'IN_PROCESS', 'FINISHED']

  validates :visit_date, presence: true

  validates :status, presence: true
  validates_inclusion_of :status, :in => STATUSES,
            :message => "status must be in #{STATUSES.join ', '}."

  validates_with DateValidator
  validates_with CheckinValidator
  validates_with CheckoutValidator

  belongs_to :user
  has_many :answers
end
