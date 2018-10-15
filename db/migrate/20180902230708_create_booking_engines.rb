class CreateBookingEngines < ActiveRecord::Migration
  def change
    create_table :booking_engines do |t|
      t.string :type_, null: false
      t.timestamps null: false
    end
  end
end
