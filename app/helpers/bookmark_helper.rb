module BookmarkHelper

	def tag_link
		raw bookmark.tag_list.map { |t| link_to t, tag_path(t) }.join(', ') 
	end 

end
