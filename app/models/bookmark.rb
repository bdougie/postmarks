class Bookmark < ActiveRecord::Base
   attr_accessible :title, :body, :tag_list, :url, :thumbnail_url
   acts_as_taggable
   
   def thumbnail_url
   		Embedly::API.new.oembed( url: self.url).first.thumbnail_url
   end

end
