class AddConfirmedAtToListing < ActiveRecord::Migration
  def change
    add_column :listings, :confirmed_at, :datetime
  end
end
