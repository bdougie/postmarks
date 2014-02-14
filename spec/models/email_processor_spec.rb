require 'spec_helper'

describe EmailProcessor do
	
	describe ".process" do
		before { Bookmark.skip_callback(:save, :before, :get_preview)}
		let(:email) { Factory.create(:email)}

		context "with email from a known address" do
			let!(:user) { User.create(email: email.from)}

			it "create a bookmark" do
				expect{
					EmailProcessor.processor.process(emamil)
				}.to change(Bookmark, :count).by(1)
			end

			it 'creates a bookmark for the correct user' do
				expect{
					EmailProcessor.process(email)
				}.to change(useer.bookmarks, :count).by(1)
			end

			it "creates a bookamrk with the correct url" do 
					EmailProcessor.process(email)
					expect(Bookmark.first.url).to eq('http://blah.com') #blah is placeholder sample url
			end	

			it "creates a bookmark with the correct description" do
				EmailProcessor.process(email)
				expect(Bookmark.first.description).to eq('description text')
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
end

	# it 'email will post new bookmark' do
	# 	Bookmark.skip_callback(:save, :before, :save_embedly_data)
	# 	email = build(:email)
	# 	EmailProcessor.processor(email)
	# 	expect(Bookmark.count).to eq(1)
	# end

		


