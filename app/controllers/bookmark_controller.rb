class BookmarkController < ApplicationController

	def index
		@bookmarks = Bookmark.all 
	end

	def show
		@bookmark = Bookmark.find(params[:id])
	end

	def new
		@bookmark = Bookmark.new
	end

	def edit
		@bookmark = Bookmark.find(params[:id])
	end

	def create
		@bookmark = Bookmark.find(params[:bookmark])
		if bookmark.save
			redirect_to @bookmark, notice: "Bookmark was saved successfully"
		else
			flash[:error] =  "There was an error creating the bookmark"
			render new
		end
	end

	def update
	end



end
