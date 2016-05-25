class AddForeignKeyToPosts < ActiveRecord::Migration
  def change
    add_foreign_key :posts, name: :owners
  end
end
