# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:owned_groups) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }
  it { should have_and_belong_to_many(:groups) }
  it { should have_many(:group_tasks).class_name('GroupTask') }
end
