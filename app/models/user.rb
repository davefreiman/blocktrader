class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :presence => true
									  :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
										:uniqueness => true
  validates :username, :presence => true
end
