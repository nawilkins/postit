class DeletePostsTable < ActiveRecord::Migration
  def change
    drop_table :posts_tables
  end
end
