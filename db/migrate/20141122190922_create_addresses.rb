class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
