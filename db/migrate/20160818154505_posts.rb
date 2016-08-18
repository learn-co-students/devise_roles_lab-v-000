class Posts < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.string :content, null: false, default: ''
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
