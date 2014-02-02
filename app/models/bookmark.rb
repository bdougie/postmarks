class Bookmark < ActiveRecord::Base
   attr_accessible :title, :body, :tag_list
   acts_as_taggable
   
end
