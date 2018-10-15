class DropAddPrice < ActiveRecord::Migration
  def change
  	
  	remove_column :listings, :price
     add_column :listings, :price, :integer
  end
end
