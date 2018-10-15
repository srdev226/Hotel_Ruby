class AddSellerApprovedToListingStatus < ActiveRecord::Migration
  def change
  	add_column :listings, :seller_approved_at, :datetime
  end
end
