class CheckoutValidator < ActiveModel::Validator
  def validate(record)
    if !record.checkout_at
      return
    end

    if !record.checkin_at
      record.errors.add(:checkout_at, "need check in to check out")
    end

    if record.checkout_at < record.checkin_at
      record.errors.add(:checkout_at, "invalid check out date")
    end
  end
end