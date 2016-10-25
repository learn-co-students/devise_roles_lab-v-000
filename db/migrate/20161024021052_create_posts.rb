class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
     t.integer  "user_id"
     t.string   "content"
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
    end
  end
end
