class CpfValidator < ActiveModel::Validator
  def validate(record)
    if !CPF.valid?(record.cpf)
      record.errors.add(:cpf, "invalid cpf")
    end
  end
end