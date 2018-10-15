class Hotel < ActiveRecord::Base
	has_many :room_types, dependent: :destroy
	has_many :listings, dependent: :destroy
  has_many :users
end
