class AddPurchasedToListings < ActiveRecord::Migration
  def change
    add_column :listings, :purchased, :boolean, default: false
  end
end
