class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :content, :text
  end
end
