class EmailProcessor
	def self.processor(email)
		# all of your application-specific code here - creating models,
		# processing reports, etc
		# user = User.find_by_email(email.from)
  #   bookmark = user.bookmarks.new
  #   bookmark.url = email.subject
  #   bookmark.description = email.body
  #   bookmark.save
  	Bookmark.create
	end
end
