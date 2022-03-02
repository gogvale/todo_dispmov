# frozen_string_literal: true

class GroupBlueprint < Blueprinter::Base
  identifier :id
  fields :name
  view :detailed do
    association :owner, blueprint: UserBlueprint
    association :users, blueprint: UserBlueprint
  end
end
