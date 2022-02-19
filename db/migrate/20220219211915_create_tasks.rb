class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.belongs_to :assignee, foreign_key: { to_table: :users }, type: :uuid
      t.boolean :completed
      t.string :description
      t.belongs_to :group, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
