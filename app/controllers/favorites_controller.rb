class FavoritesController < ApplicationController

	def create
		authorize! :create, Favorite, message: "You cannot do that"
		@bookmark = Bookmark.find(params[:bookmark_id])

		favorite = current_user.favorites.create(bookmark: @bookmark)
		if favorite.valid?
			flash[:notice] = "Favorited bookmark"
			redirect_to [@bookmark]
		else
			flash[:error] = "Unable to add favorite. Please try again."
			redirect_to [@bookmark]
		end
	end

	def destroy
		authorize! :destroy, @favorite, message: "You cannot do that"
		@bookmark = Bookmark.find(params[:bookmark_id])
		@favorite = current_user.favorites.find(params[:id])

		if @favorite.destroy
			flash[:notice] = "Removed favorite."
			redirect_to [@bookmark]
		else
			flash[:error] = "Unable to remove favorite. Please try again."
			redirect_to [@bookmark]
		end 
	end

	def index
		@favorites = Favorite.all
  end


	
end
