class BookmarksController < ApplicationController
	before_filter :authorize, only: [:edit, :update, :destroy]
	
	def index
		if params[:tag]
			@bookmarks = Bookmark.tagged_with(params[:tag])
		else
			@bookmarks = Bookmark.all 
		end
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
		@bookmark = Bookmark.new(params[:bookmark])
		@bookmark.user = current_user
		if @bookmark.save
			redirect_to bookmarks_path, notice: "Bookmark was saved successfully"
		else
			flash[:error] =  "There was an error creating the bookmark"
			render new
		end
	end

	def update
		@bookmark = Bookmark.find(params[:id])
		if @bookmark.update_attributes(params[:bookmark])
			redirect_to bookmarks_path, notice: "Bookmark was updated successfully."
		else
			flash[:error] = "There was error updating the Bookmark, not sure what though"
			render :edit
		end
	end

	def destroy
		@bookmark = Bookmark.find(params[:id])
		name = @bookmark.title

    if @bookmark.destroy
      flash[:notice] = "\"#{name}\" bookmark was deleted successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :index
    end

	end


end
