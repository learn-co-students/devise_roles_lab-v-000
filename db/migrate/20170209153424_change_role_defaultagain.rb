class ChangeRoleDefaultagain < ActiveRecord::Migration
  def change
    change_column_default :posts, :role, :user
  end
end
