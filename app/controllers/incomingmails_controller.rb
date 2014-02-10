class IncomingMailsController < ActiveController

	require 'mail'
	skip_before_filter: verify_authenticity_token

	def create
		
	end

end