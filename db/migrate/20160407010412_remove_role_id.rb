class RemoveRoleId < ActiveRecord::Migration
  def up
    remove_column :users, :role_id
  end

  def down
    add_column :users, :role_id, :integer
  end
end
