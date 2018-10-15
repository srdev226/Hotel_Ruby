class CastTextCheckIn < ActiveRecord::Migration
  def change

  	change_column :listings, :check_in_date, 'text using cast(check_in_date as text)'
  end
end
