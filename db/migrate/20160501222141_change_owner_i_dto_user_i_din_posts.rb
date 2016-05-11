class ChangeOwnerIDtoUserIDinPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename  :owner_id, :user_id
    end
  end
end
