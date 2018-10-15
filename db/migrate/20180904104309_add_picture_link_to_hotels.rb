class AddPictureLinkToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :picture_link, :string
  end
end
