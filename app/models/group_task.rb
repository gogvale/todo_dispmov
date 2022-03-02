# frozen_string_literal: true

class GroupTask < ApplicationRecord
  validates :description, presence: true
  attribute :completed, :boolean, default: false
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :group
end
