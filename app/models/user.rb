class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  has_secure_password
  before_save { self.email = email.downcase }

  validates :password, presence: true, allow_nil: false

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },
                    presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
end
