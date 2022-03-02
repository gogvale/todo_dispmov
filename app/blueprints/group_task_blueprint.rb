# frozen_string_literal: true

class GroupTaskBlueprint < Blueprinter::Base
  identifier :id
  fields :description, :completed
  association :assignee, blueprint: UserBlueprint
end
