class AddRankToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :rank, :float
  end
end
