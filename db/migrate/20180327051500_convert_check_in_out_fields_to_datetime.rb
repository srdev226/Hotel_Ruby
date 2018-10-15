class ConvertCheckInOutFieldsToDatetime < ActiveRecord::Migration
  def up
    add_column :listings, :check_in, :date
    add_column :listings, :check_out, :date

    Listing.all.each do |listing|
      listing.update_attributes(
        check_in: listing.check_in_date.to_date,
        check_out: listing.check_out_date.to_date,
      )
    end
  end

  def down
    remove_column :listings, :check_in
    remove_column :listings, :check_out
  end
end
