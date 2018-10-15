class ChangeIn < ActiveRecord::Migration

  def change
  	change_column :listings, :check_in_date,  :string
  end
  
end
