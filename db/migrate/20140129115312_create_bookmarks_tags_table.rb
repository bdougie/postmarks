class CreateBookmarksTagsTable < ActiveRecord::Migration
  
  create_table :bookmark_tags do |t|
      t.belongs_to :bookmark
      t.belongs_to :tag
    end

end
