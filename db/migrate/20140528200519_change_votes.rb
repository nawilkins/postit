class ChangeVotes < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.remove :voteable_type
    end
    add_column :votes, :voteable_type, :string
  end
end
