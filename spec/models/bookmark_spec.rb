require 'spec_helper'

describe Bookmark do	

	context "Attributes for for bookmarks" do
	  it "should have a title and body" do
	    @bookmark = Bookmark.new(title: "First", body: "This is the body")
		end

  end
end
