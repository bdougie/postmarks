class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user
      t.references :bookmark

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :bookmark_id
  end
end
