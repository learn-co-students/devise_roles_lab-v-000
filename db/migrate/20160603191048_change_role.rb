class ChangeRole < ActiveRecord::Migration
  def change
    remove_column :users, :role 
    add_column :users, :role, :integer, :default => 0
  end
end
