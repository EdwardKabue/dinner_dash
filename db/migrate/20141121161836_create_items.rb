class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.float :price
      t.binary :photo

      t.timestamps
    end
  end
end
