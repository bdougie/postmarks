class Bookmark < ActiveRecord::Migration
  create_table :Bookmarks do |t|

  t.string :title
  t.text :body

  t.timestamps
	end
end
