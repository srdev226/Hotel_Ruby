class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :fullname, null:false
      t.string :shortname, null:false
      t.timestamps null: false
    end
  end
end
