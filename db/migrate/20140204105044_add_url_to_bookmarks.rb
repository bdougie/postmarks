class AddUrlToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :url, :string
    add_column :bookmarks, :thumbnail_url, :string
  end
end
