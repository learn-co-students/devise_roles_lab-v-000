class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :email
      t.string :role
      t.text :content
      t.belongs_to :user 

      t.timestamps null: false
    end
  end
end
