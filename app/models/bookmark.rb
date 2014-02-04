class Bookmark < ActiveRecord::Base
   attr_accessible :title, :body, :tag_list, :url
   acts_as_taggable
   
end
