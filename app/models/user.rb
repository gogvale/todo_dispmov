# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password
  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :owned_groups, class_name: 'Group', inverse_of: :owner, foreign_key: 'owner_id'
  has_and_belongs_to_many :groups, class_name: 'Group'
  has_many :group_tasks, through: :groups

  private

  def downcase_email
    self.email = email&.downcase
  end
end
