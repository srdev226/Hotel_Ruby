class AddBuyerIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :buyer_id, :integer
  end
end
