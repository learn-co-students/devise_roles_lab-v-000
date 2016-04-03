class DeviseCreatePosts < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.string :content
      t.integer :owner_id
    end
  end
end
