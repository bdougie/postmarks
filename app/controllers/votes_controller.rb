class VotesController < ApplicationController
	before_filter :setup

	def up_vote
		update_vote(1)
		redirect_to :back
	end

	def down_vote
		update_vote(-1)
		redirect_to :back
	end

	private

	def setup
		@bookmark = Bookmark.find(params[:bookmark_id])
		authorize! :create, Vote, message: "You need to be a user to do that."

		@vote = @bookmark.votes.where(user_id: current_user.id).first
	end

	def update_vote(new_value)
		if @vote
			@vote.update_attribute(:value, new_value)
		else
			@vote = current_user.votes.create(value: new_value, bookmark: @bookmark)
		end
	end
end