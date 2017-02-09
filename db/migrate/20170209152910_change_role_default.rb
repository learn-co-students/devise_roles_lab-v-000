class ChangeRoleDefault < ActiveRecord::Migration
  def change
    change_column_default :posts, :role, from: nil, to: :user
  end
end
