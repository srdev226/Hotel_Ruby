class RoomType < ActiveRecord::Base
	belongs_to :hotel
	has_many :listings
end
