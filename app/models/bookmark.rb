class Bookmark < ActiveRecord::Base
   attr_accessible :title, :body, :tag_list, :url, :thumbnail_url
   acts_as_taggable
   has_many :votes, dependent: :destroy
   before_save :save_embedly_data

   default_scope order('rank DESC')


   def save_embedly_data
      embedly = Embedly::API.new.oembed( url: self.url).first
      self.thumbnail_url = embedly.thumbnail_url
      self.title = embedly.title
   end

   def up_votes
      self.votes.where(value: 1).count
   end

   def down_votes
      self.votes.where(value: -1).count
   end

   def points
      self.votes.sum(:value).to_i     
   end 

   def update_rank
      age = (self.created_at - Time.new(1970,1,1)) / 86400
      new_rank = points + age

      self.update_attribute(:rank, new_rank)
   end

   private

   def create_vote
      self.user.votes.create(value: 1, bookmark: self)
   end

   
   # def thumbnail_url
   # 		Embedly::API.new.oembed( url: self.url).first.thumbnail_url
   # end

   # def title_url
   # 		Embedly::API.new.oembed( url: self.url).first.title
   # end

   # def description_url
   # 		Embedly::API.new.oembed( url: self.url).first.description
   # end

end
