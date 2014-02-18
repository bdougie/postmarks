class UsersController < ApplicationController

	def new
		@user = User.new
		# @user.set_attribute(:role 'member')
		# @user.save
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
			# @user.set_attribute(:role 'member')
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	def show
		@user = params[:id] ? User.find(params[:id]) : current_user

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
