class ChangeOwnerIdToUserId < ActiveRecord::Migration
  def change
    remove_column :users, :owner_id, :integer
    add_column :users, :user_id, :integer
  end
end
