class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
  attr_accessible :value, :bookmark

  validates :value, inclusion: { in: [-1,1], message: "%{value} is not a valid vote."}
end
