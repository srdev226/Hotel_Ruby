class AddDetailsToListing < ActiveRecord::Migration
  def change
    add_column :listings, :hotel, :string
    add_column :listings, :bookingengine, :string
    add_column :listings, :room_type, :string
  end
end
