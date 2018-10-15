class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|

      t.timestamps null: false
    end
  end
end
