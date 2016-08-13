class RenameOwnerIdColumn < ActiveRecord::Migration
  def change
    rename_column :posts, :owner_id, :user_id
  end
end
