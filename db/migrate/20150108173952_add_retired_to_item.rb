class AddRetiredToItem < ActiveRecord::Migration
  def change
    add_column :items, :retired, :boolean
  end
end
