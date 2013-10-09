class Image < ActiveRecord::Base

	belongs_to :auction
	

	mount_uploader :file, ImageUploader

	validates :auction, presence: true
	validates :file, presence: true
end
