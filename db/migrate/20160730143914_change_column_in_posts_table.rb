class ChangeColumnInPostsTable < ActiveRecord::Migration
  def change
    remove_column :posts, :owner, :string
    add_column :posts, :user_id, :integer
  end
end
