# frozen_string_literal: true

class GroupTask < ApplicationRecord
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :group
end
