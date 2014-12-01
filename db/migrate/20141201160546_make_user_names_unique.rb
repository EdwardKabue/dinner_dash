class MakeUserNamesUnique < ActiveRecord::Migration
  def change
  	add_index :users, [:full_name, :display_name], unique: true
  end
end
