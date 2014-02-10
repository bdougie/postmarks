class RenameBodysToBody < ActiveRecord::Migration
  def change
  	rename_column :bookmarks, :bodys, :body

  end
end
