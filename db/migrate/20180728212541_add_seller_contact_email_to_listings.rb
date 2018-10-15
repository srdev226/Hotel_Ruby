class AddSellerContactEmailToListings < ActiveRecord::Migration
  def change
    add_column :listings, :seller_contact_email, :string
  end
end
