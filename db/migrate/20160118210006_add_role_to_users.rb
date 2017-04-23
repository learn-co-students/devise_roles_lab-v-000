class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, :default => "user"
  end
end
