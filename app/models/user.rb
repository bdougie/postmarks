class User < ActiveRecord::Base
	has_secure_password

  attr_accessible :email, :password_digest, :password_confirmation, :password

  validates_uniqueness_of :email

  has_many :votes, dependent: :destroy
end
