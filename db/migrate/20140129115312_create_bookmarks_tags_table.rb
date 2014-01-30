class CreateBookmarksTagsTable < ActiveRecord::Migration
  
  create_table :bookmark_tags do |t|
      t.belongs_to :bookmarks
      t.belongs_to :tags
    end

end
