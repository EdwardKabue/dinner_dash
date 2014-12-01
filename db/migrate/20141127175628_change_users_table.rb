class ChangeUsersTable < ActiveRecord::Migration
  def change
  	rename_column :users, :password, :password_digest
  	add_column :users, :admin, :boolean, default: false
  	change_column_default :line_items, :quantity, 1 
  end
end
