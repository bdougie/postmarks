class Bookmark < ActiveRecord::Base
   attr_accessible :title, :body, :tags, :tags_attributes

  has_and_belongs_to_many :tags
   
end
