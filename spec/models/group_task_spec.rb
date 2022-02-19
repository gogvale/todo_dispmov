# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupTask, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:assignee).class_name('User').optional(true) }
end
