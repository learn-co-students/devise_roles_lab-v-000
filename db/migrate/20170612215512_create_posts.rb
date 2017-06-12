class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
