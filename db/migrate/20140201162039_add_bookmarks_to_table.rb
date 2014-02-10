class AddBookmarksToTable < ActiveRecord::Migration
	def change
	  create_table :bookmarks do |t|

		  t.string :title
		  t.text :bodys

		  t.timestamps
		end
	end
end

