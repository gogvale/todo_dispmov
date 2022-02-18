class CreateGroupsAndUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_users, id: false do |t|
      t.belongs_to :group, null: false, foreign_key: true, type: :uuid
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
    end
  end
end
