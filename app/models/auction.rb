class Auction < ActiveRecord::Base
	belongs_to :user
	has_many :bids
	has_many :users, :through => :bids

	validates :name, presence: true
	validates :duration, presence: true,
											 numericality: {only_integer: true, greater_than: 0}
	validates :start_price, presence: true,
													numericality: {only_integer: true, greater_than: 0}


	def remainder
		deadline = self.created_at + self.duration.hours
		remainder = deadline - Time.zone.now
		remainder.to_i
	end

	def time_remaining
		if self.completed?
			"Complete!"
		else
			Time.zone.at(self.remainder).utc.strftime("%e:%H:%M:%S")				 	
		end
	end

	def completed?
		self.remainder <= 0				 	
	end

	def current_price
		if self.bids.first == nil || self.bids.first.amount == nil
			 self.start_price 		 
		else
			self.bids.where.not("amount" => nil).last.amount
		end		
	end
end
