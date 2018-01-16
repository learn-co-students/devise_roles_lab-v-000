class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :users, :role, :integer, default: "user"
  end
end
