class User < ApplicationRecord
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  VALID_PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,}/

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }

  validates :password, presence: true,  confirmation: true,
                                        length: {:within => 6..22},
                                        format: { with: VALID_PASSWORD_REGEX }

  validates :password_confirmation, presence: true

  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: true }

  validates :cpf, presence: true, uniqueness: true
  validates_with CpfValidator

  has_many :formularies

  def as_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end
end
