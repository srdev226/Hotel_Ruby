class AddDropCheckIn < ActiveRecord::Migration
  def change

  	remove_column :listings, :check_in_date
     add_column :listings, :check_in_date, :string
  end
end
