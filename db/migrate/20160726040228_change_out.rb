class ChangeOut < ActiveRecord::Migration
  def change
  	change_column :listings, :check_out_date,  :string
  end
end
