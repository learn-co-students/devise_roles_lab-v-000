class ChangeColumnRole < ActiveRecord::Migration
  def change
    change_column :posts, :role, :integer, default: 0
  end
end
