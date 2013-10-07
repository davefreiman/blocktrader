class Auction < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :duration, presence: true,
											 numericality: {only_integer: true, greater_than: 0}
	validates :start_price, presence: true,
													numericality: {only_integer: true, greater_than: 0}


	def remainder
		deadline = self.created_at + self.duration.hours
		remainder = deadline - DateTime.now
		remainder.to_i
	end

	def time_remaining(remainder)
		Time.at(remainder).utc.strftime("%H:%M:%S")				 	
	end

	def completed?(remainder)
		remainder <= 0				 	
	end													 
end
