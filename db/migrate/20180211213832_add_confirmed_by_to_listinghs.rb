class AddConfirmedByToListinghs < ActiveRecord::Migration
  def change
    add_column :listings, :confirmed_by, :string
  end
end
