# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def downcase_email
    self.email = email.downcase
  end
end
