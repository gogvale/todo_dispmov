# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups, id: :uuid do |t|
      t.string :name
      t.belongs_to :owner, index: true, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
