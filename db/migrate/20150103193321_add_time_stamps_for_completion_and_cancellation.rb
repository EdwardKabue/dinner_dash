class AddTimeStampsForCompletionAndCancellation < ActiveRecord::Migration
  def change
  	add_column :orders, :completed_at, :datetime
  	add_column :orders, :cancelled_at, :datetime
  end
end
