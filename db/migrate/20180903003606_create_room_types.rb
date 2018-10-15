class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.belongs_to :hotel
      t.string :type_, null: false
      t.string :description
      t.string :picture_link
      t.timestamps null: false
    end
  end
end
