class EmailProcessor
	def self.process(email)
  	bookmark = Bookmark.new
		
		# all of your application-specific code here - creating models,
		# processing reports, etc
		if user = User.find_by_email(email.from)
			bookmark.user = user
	    bookmark.url = email.subject
	    email.subject.split(' ').find do |t|
	    	t.start_with?('http')
	    end
	    bookmark.save!
	  	bookmark
	  end
	end
end


# "hello this http://google.com is my link"