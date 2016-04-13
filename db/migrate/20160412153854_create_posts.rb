class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :owner

      t.timestamps null: false
    end

    add_index :posts, :owner
  end
end
