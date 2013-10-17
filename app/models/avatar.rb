class Avatar < ActiveRecord::Base

	belongs_to :user
	

	mount_uploader :file, AvatarUploader

	validates :user, presence: true
	validates :file, presence: true
end
