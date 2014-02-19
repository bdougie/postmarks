class User < ActiveRecord::Base
	has_secure_password

  attr_accessible :email, :password_digest, :password_confirmation, :password, :name

  validates_uniqueness_of :email

  has_many :votes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_bookmarks, through: :favorites, source: :bookmark


  def favorited(bookmark)
    self.favorites.where(bookmark_id: bookmark).first
  end
  

	ROLES = %w[member admin]
  def role?(base_role)
  	if role.nil?
  		false
		else
			ROLES.index(base_role.to_s) <= ROLES.index(self.role)
		end
  end

end
