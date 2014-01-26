class CreateBookmark < ActiveRecord::Migration
  def change
    create_table :bookmark do |t|

    	t.string :title
    	t.string :body

      t.timestamps
    end
  end
end
