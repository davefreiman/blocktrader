class Auction < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :duration, presence: true,
											 numericality: {only_integer: true, greater_than: 0}
	validates :starting_price, presence: true
														 numericality: {only_integer: true, greater_than: 0}
end
