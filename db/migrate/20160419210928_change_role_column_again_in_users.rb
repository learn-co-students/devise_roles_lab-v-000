class ChangeRoleColumnAgainInUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :integer, default: 2
  end
end
