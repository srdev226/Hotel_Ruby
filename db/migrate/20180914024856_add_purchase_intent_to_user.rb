class AddPurchaseIntentToUser < ActiveRecord::Migration
  def change
    add_column :users, :purchase_intent, :integer
  end
end
