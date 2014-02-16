class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
		@bookmarks = @user.bookmarks.visible_to(current_user)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @bookmark.update_attributes(params[:bookmark])
			redirect_to @bookmark
		else
			flash[:error] = "Error saving bookmark. Please try again"
			render :edit
		end
	end

end
