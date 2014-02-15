require 'spec_helper'

describe EmailProcessor do
	
	describe ".process" do
		before { Bookmark.skip_callback(:save, :before, :save_embedly_data)}
		let(:email) { FactoryGirl.create(:email)}

		context "with email from a known address" do
			let!(:user) do
				user = User.new(email: email.from)
				user.save(validate: false)
				user
			end

			it "create a bookmark" do
				expect{
					EmailProcessor.process(email)
				}.to change(Bookmark, :count).by(1)
			end

			it 'creates a bookmark for the correct user' do
				expect{
					EmailProcessor.process(email)
				}.to change(user.bookmarks, :count).by(1)
			end

			it "creates a bookamrk with the correct url" do 
					expect(EmailProcessor.process(email).url).to eq('email subject') #blah is placeholder sample url
			end	

			it "creates a bookmark with the correct description" do
				
				expect(EmailProcessor.process(email).url).to eq('email subject')
			end
		end

		context "with email from an unknown address" do 
			it "doesnt create a bookmark" do 
				expect{
					EmailProcessor.process(email)
				}.to_not change(Bookmark, :count)
			end
		end
	
	end
end

	# it 'email will post new bookmark' do
	# 	Bookmark.skip_callback(:save, :before, :save_embedly_data)
	# 	email = build(:email)
	# 	EmailProcessor.processor(email)
	# 	expect(Bookmark.count).to eq(1)
	# end

		


