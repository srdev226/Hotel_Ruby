class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :stripe_token
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
