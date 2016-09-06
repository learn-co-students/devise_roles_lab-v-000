class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :owner
      t.string :content
    end
  end
end
