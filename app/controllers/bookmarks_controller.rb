class BookmarksController < ApplicationController

	def index
		@bookmarks = Bookmark.all 
	end

	def show
		@bookmark = Bookmark.find(params[:id])
	end

	def new
		@bookmark = Bookmark.new
		@tag = Tag.new
	end

	def edit
		@bookmark = Bookmark.find(params[:id])
	end

	def create
		@bookmark = Bookmark.new(params[:bookmark])
		@tags = Tag.find_and_create_by_name[:tags]

		if @bookmark.save
			redirect_to bookmarks_path, notice: "Bookmark was saved successfully"
		else
			flash[:error] =  "There was an error creating the bookmark"
			render new
		end
	end

	def update
	end



end
