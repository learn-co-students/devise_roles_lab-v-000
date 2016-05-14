class ChangePostTable < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :user_id
      t.string  :content
    end
  end
end
