class AddSwitchedAtToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :switched_at, :datetime
  end
end
