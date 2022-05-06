class Answer < ApplicationRecord
  before_create :set_time_stamps
  before_save :set_time_stamps

  validates :question_id, presence: true
  validates :content, presence: true

  belongs_to :question
  belongs_to :visit

  private
    def set_time_stamps
      self.answered_at = DateTime.now if self.new_record?
      self.updated_answer_at = DateTime.now
    end
end
