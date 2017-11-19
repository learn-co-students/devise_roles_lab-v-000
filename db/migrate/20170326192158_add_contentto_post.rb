class AddContenttoPost < ActiveRecord::Migration
  def change
    add_column :posts, :content, :text
  end
end
