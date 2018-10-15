class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      # t.belongs_to :hotel
      # t.belongs_to :booking_engine
      t.string :hotel
      t.string :bookingengine
      t.string :check_in_date
      t.string :check_out_date
      t.string :room_type
      # t.belongs_to :room_type
      t.string :price

      t.timestamps null: false
    end
  end
end
