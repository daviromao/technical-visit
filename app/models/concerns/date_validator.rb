class DateValidator < ActiveModel::Validator
  def validate(record)
    if !record.visit_date || record.visit_date < Time.now.to_date
      record.errors.add(:visit_date, "invalid date")
    end
  end
end