class Formulary < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :questions
  def as_json(options={})
    super(include:  :questions)
  end

end
