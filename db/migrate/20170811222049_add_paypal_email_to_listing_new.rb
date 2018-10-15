class AddPaypalEmailToListingNew < ActiveRecord::Migration
  def change

  	add_column :listings, :paypal_email, :string
  end
end
