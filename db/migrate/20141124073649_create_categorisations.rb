class CreateCategorisations < ActiveRecord::Migration
  def change
    create_table :categorisations do |t|
      t.integer :category_id
      t.integer :item_id

      t.timestamps
    end
  end
end
