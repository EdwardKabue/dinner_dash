class RemovePhotoFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :photo, :binary
  end
end
