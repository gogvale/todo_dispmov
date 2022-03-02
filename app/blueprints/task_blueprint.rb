# frozen_string_literal: true

class TaskBlueprint < Blueprinter::Base
  identifier :id
  fields :description, :completed
  association :assignee, blueprint: UserBlueprint
end
