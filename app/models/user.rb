class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :auctions
  has_many :locations
	has_many :bids
	has_many :auctions, :through => :bids
  has_many :notifications
  has_many :ratings
  has_many :avatars

  validates :email, :presence => true,
									  :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
										:uniqueness => true
  validates :username, :presence => true
end
