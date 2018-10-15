class RemoveHotelFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :hotel, :string
    remove_column :listings, :bookingengine, :string
    remove_column :listings, :room_type, :string
  end
end
