class EmailProcessor
	def self.processor(email)
		# all of your application-specific code here - creating models,
		# processing reports, etc

		Rails.logger.log params[:envelope][:to] # print the to field to the logs
    Rails.logger.log params[:subject] # print the subject to the logs
    Rails.logger.log params[:plain] # print the decoded body plain to the logs if present
    Rails.logger.log params[:html] # print the html decoded body to the logs if present

	end
end
