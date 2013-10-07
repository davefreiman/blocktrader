class Bid < ActiveRecord::Base
	belongs_to :auction
	belongs_to :user

	validates :auction_id, :presence => true
	validates :amount, :presence => true,
		:numericality => {:only_integer => true, }
	validate :amount_must_be_greater_than_current_price


	def amount_must_be_greater_than_current_price
		if amount <= self.auction.current_price
			errors.add(:amount, "BID MORE NOW")
		end	
	end

end
