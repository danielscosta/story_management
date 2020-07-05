class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, message: "Should have at least six characters" }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Bad Format" }, uniqueness: { case_sensitive: false }
  validates :role, presence: true, inclusion: { in: %w(editor writer) }
  belongs_to :organization

  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
end
