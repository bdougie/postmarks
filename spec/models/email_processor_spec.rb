require 'spec_helper'

describe EmailProcessor do
	
	it 'email will post new bookmark' do
		Bookmark.skip_callback(:save, :before, :save_embedly_data)
		email = build(:email)
		EmailProcessor.processor(email)
		expect(Bookmark.count).to eq(1)
	end

	pending 'should save url as in bookmark'
		


end