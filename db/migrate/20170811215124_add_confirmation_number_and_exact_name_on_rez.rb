class AddConfirmationNumberAndExactNameOnRez < ActiveRecord::Migration
  def change
  	add_column :listings, :confirmation_number, :string

    add_column :listings, :name_on_reservation, :string
  end
end
