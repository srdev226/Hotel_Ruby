class AddSellerPhoneToListings < ActiveRecord::Migration
  def change
    add_column :listings, :seller_phone, :string
  end
end
