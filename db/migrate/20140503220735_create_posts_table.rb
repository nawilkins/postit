class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts_tables do |t|
      t.string :title
      t.string :url
      t.text :description
    end
  end
end
