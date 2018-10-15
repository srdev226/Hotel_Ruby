class AddPaidStatusToListing < ActiveRecord::Migration
  def change

  	add_column :listings, :paid_status, :string
  end
end
