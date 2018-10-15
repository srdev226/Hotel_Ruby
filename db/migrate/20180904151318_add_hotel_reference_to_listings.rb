class AddHotelReferenceToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :hotel, index: true, foreign_key: true
    add_reference :listings, :booking_engine, index: true, foreign_key: true
    add_reference :listings, :room_type, index: true, foreign_key: true
  end
end
