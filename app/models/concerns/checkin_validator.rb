class CheckinValidator < ActiveModel::Validator
  def validate(record)
    if !record.checkin_at
      return
    end
    
    if record.checkin_at > Time.now.to_date
      record.errors.add(:checkin_at, "invalid check in date")
    end

    if record.checkout_at
      if record.checkout_at < record.checkin_at
        record.errors.add(:checkin_at, "invalid check in date")
      end
    end

  end
end