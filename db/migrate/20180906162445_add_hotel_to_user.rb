class AddHotelToUser < ActiveRecord::Migration
  def change
    add_reference :users, :hotel, index: true, foreign_key: true
  end
end
