class AddDefaultRole < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => 'user'
    change_column :users, :role_id, :integer, :default => 0
  end
end
